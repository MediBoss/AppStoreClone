//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import SDWebImage
import UIKit

class SearchResultCell: UICollectionViewCell {
    
    static let cellID = "appSearchControllerCell"
    
    var appResult: ResultType! {
        didSet {
            
            let appIconUrl = URL(string: appResult.artworkUrl100)
            
            appTitleLabel.text = appResult.trackName
            categoryLabel.text = appResult.primaryGenreName
            ratingsLabel.text = "Rating: \(appResult.averageUserRating ?? 0.0)"
            appThumbnailView.sd_setImage(with: appIconUrl)
            screenshot1ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[0]))
            
            if appResult.screenshotUrls.count > 1 {
                screenshot2ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[1]))
            }
            
            if appResult.screenshotUrls.count > 2 {
                screenshot3ImageView.sd_setImage(with: URL(string: appResult.screenshotUrls[2]))
            }
        }
    }
    
    let appThumbnailView: UIImageView =  {
        
        let iv = UIImageView()
        
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        
        return iv
    }()
    
    
    let appTitleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let categoryLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Photos & Video"
        return label
    }()

    
    let ratingsLabel: UILabel = {
        
        let label = UILabel()
        label.text = "9.67M"
        return label
    }()

    
    let getButton: UIButton = {
        
        let button = UIButton(type: .system)
        
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.layer.cornerRadius = 15
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        button.heightAnchor.constraint(equalToConstant: 32).isActive = true
        
        return button
    }()
    
    lazy var screenshot1ImageView = self.createScreenShotImageView()
    lazy var screenshot2ImageView = self.createScreenShotImageView()
    lazy var screenshot3ImageView = self.createScreenShotImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureAllStackViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func createScreenShotImageView() -> UIImageView{
        
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor(white: 0.5, alpha: 0.5).cgColor
        imageView.contentMode = .scaleAspectFill
        
        return imageView
    }
    
    
    
    fileprivate func configureAllStackViews() {
        
        let labelsStackView = CustomStackView(arrangedSubviews: [appTitleLabel, categoryLabel, ratingsLabel],
                                              axis: .vertical,
                                              distribution: .fill)
        
        
        let screenshostStackView = CustomStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView],
                                                   spacing: 12,
                                                   axis: .horizontal,
                                                   distribution: .fillEqually)
        
        
        let infoTopStackView = CustomStackView(arrangedSubviews: [appThumbnailView, labelsStackView, getButton],
                                               spacing: 12,
                                               axis: .horizontal,
                                               distribution: .fill)
        
        infoTopStackView.alignment = .center
        
        let overallStackView = CustomStackView(arrangedSubviews: [infoTopStackView, screenshostStackView],
                                               spacing: 16,
                                               axis: .vertical,
                                               distribution: .fill)
        
        addSubview(overallStackView)
        overallStackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}

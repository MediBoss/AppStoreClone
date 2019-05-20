//
//  SearchResultCell.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class SearchResultCell: UICollectionViewCell {
    
    static let cellID = "appSearchControllerCell"
    
    let appThumbnailView: UIImageView =  {
        
        let iv = UIImageView()
        iv.backgroundColor = .red
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
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
        
        backgroundColor = .green
        
        let labelsStackView = UIStackView(arrangedSubviews: [appTitleLabel, categoryLabel, ratingsLabel])
        labelsStackView.axis = .vertical
        
        let stackView = UIStackView(arrangedSubviews: [appThumbnailView, labelsStackView, getButton])
        stackView.spacing = 12
        stackView.alignment = .center
        
        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createScreenShotImageView() -> UIImageView{
        
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        return imageView
    }
}

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
        return iv
    }()
    
    let appTitleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "App Name"
        return label
    }()
    
    let getButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        
        let stackView = UIStackView(arrangedSubviews: [appThumbnailView, appTitleLabel, getButton])
        stackView.spacing = 12
        
        addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.safeAreaLayoutGuide.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        stackView.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        stackView.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

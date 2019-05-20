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
        return iv
    }()
    
    let appTitleLabel: UILabel = {
       
        let label = UILabel()
        label.text = "App Name"
        
        return label
    }()
    
    let getButton: UIButton
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

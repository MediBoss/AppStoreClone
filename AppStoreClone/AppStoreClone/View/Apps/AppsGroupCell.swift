//
//  AppsGroupCell.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/25/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class AppsGroupsCell: UICollectionViewCell {
    
    static let cellID = "AppsGroupsCell"
    let appSectionLabel: UILabel = {
        
        let label = UILabel()
        label.text = "App Section"
        label.font = .boldSystemFont(ofSize: 30)
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .red
        
        addSubview(appSectionLabel)
        appSectionLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

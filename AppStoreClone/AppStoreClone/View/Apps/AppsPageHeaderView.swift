//
//  AppsPageHeaderView.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/9/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AppsPageHeaderView: UICollectionReusableView {
    
    let appHeaderhorizontalController = AppHeaderHorizontalCollectionView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderhorizontalController.view)
        appHeaderhorizontalController.view.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


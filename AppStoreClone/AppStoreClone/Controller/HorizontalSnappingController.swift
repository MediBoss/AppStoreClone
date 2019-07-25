//
//  HorizontalSnappingController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/25/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class HorizontalSnappingController: UICollectionViewController {
    
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SnappingLayout: UICollectionViewFlowLayout {
    
    // Add cell snapping behavior
}

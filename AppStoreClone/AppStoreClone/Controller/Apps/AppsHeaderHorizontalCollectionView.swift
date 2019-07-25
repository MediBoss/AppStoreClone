//
//  AppsHeaderHorizontalCollectionView.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/9/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AppHeaderHorizontalCollectionView: BaseUICollectionViewList, UICollectionViewDelegateFlowLayout {
    
    let cellId = "cellId"
    
    var socialApps = [SocialApp]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = .white
        collectionView.register(AppHeaderCell.self, forCellWithReuseIdentifier: cellId)
        
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return socialApps.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! AppHeaderCell
        let currentSocialApp = self.socialApps[indexPath.row]
        
        cell.companyNameLabel.text = currentSocialApp.name
        cell.posterImageView.sd_setImage(with: URL(string: currentSocialApp.imageUrl), completed: nil)
        cell.blurbLabel.text = currentSocialApp.tagline
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: view.frame.height)
    }
}

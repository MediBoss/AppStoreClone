//
//  AppsHorizontalController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/9/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit
import SDWebImage

class AppsHorizontalController: HorizontalSnappingController, UICollectionViewDelegateFlowLayout {
    
    let cellID = "AppsHorizontalControllerCellId"
    let topBottomPadding: CGFloat = 12
    let lineSpacing: CGFloat = 10
    
    var appGroup: AppGroup?{
        didSet{
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.register(AppRowCell.self, forCellWithReuseIdentifier: cellID)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroup?.feed.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! AppRowCell
        let url = URL(string: (appGroup?.feed.results[indexPath.row].artworkUrl100)!)
        
        cell.appNameLabel.text = appGroup?.feed.results[indexPath.row].name
        cell.companyLabel.text = appGroup?.feed.results[indexPath.row].artistName
        cell.appIconImageView.sd_setImage(with: url)

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // multiplying by 2 because we have two paddings and 2 linespacing. Diving by three because we want 3 cells
        let height = (view.frame.height - 2 * topBottomPadding - 2 * lineSpacing) / 3
        return .init(width: view.frame.width - 48, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return .init(top: 12, left: 16, bottom: 12, right: 12)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}

//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import SDWebImage
import UIKit

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    fileprivate var appSearchResults = [ResultType]()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.backgroundColor = .white
        
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.cellID)
        fetchItunesApps()
    }
    
    func fetchItunesApps() {
        
        AppSearchService.shared.fetchApps { (searchResult) in
            switch searchResult {
            case let .success(apps):
                
                self.appSearchResults = apps
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            case let .failure(error):
                print("error found")
            }
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.appSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellID, for: indexPath) as! SearchResultCell
        let currentResult = appSearchResults[indexPath.item]
        let appIconUrl = URL(string: currentResult.artworkUrl100)
        
        cell.appTitleLabel.text = currentResult.trackName
        cell.categoryLabel.text = currentResult.primaryGenreName
        cell.ratingsLabel.text = "Rating: \(currentResult.averageUserRating ?? 0.0)"
        cell.appThumbnailView.sd_setImage(with: appIconUrl)
        cell.screenshot1ImageView.sd_setImage(with: URL(string: currentResult.screenshotUrls[0]))
        
        if currentResult.screenshotUrls.count > 1 {
            cell.screenshot2ImageView.sd_setImage(with: URL(string: currentResult.screenshotUrls[1]))
        }
        
        if currentResult.screenshotUrls.count > 2 {
            cell.screenshot3ImageView.sd_setImage(with: URL(string: currentResult.screenshotUrls[2]))
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

//
//  AppsViewController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/25/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation
import UIKit

class AppsViewConteroller: BaseUICollectionViewList, UICollectionViewDelegateFlowLayout {
    
    let headerId = "headerid"
    
    var appGroups = [AppGroup]()
    var socialApps = [SocialApp]()
    
    var spinner: UIActivityIndicatorView = {
        
        let iv = UIActivityIndicatorView(style: .whiteLarge)
        iv.color = .black
        iv.hidesWhenStopped = true
        iv.startAnimating()
        return iv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupsCell.self, forCellWithReuseIdentifier: AppsGroupsCell.cellID)
        
        // STEP 1 : Register CollectionReusableView
        collectionView.register(AppsPageHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        view.addSubview(spinner)
        spinner.fillSuperview()
        
        fetchAppGroups()
    }
    
    
    private func fetchAppGroups() {
        
        let dispatchGroup = DispatchGroup()
        
        dispatchGroup.enter()
        AppSearchService.shared.fetchByType(type: .topFree) { (app, err) in
            
            dispatchGroup.leave()
            self.appGroups.append(app!)
        }
        
        dispatchGroup.enter()
        AppSearchService.shared.fetchByType(type: .topGrossing) { (app, err) in
            
            dispatchGroup.leave()
            self.appGroups.append(app!)
        }
        
        dispatchGroup.enter()
        AppSearchService.shared.fetchByType(type: .newGames) { (app, err) in
            
            dispatchGroup.leave()
            self.appGroups.append(app!)
        }
        
        dispatchGroup.enter()
        AppSearchService.shared.fetchByType(type: .topPaid) { (app, err) in
            
            dispatchGroup.leave()
            self.appGroups.append(app!)
        }
        
        dispatchGroup.enter()
        AppSearchService.shared.fetchSocialApps { (apps, err) in
            dispatchGroup.leave()
            self.socialApps = apps ?? []
        }
        
        dispatchGroup.notify(queue: .main) {
            
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                self.spinner.stopAnimating()
                self.collectionView.reloadData()
            }
            print("completed all async tasks")
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return appGroups.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupsCell.cellID, for: indexPath) as! AppsGroupsCell
        let group = appGroups[indexPath.row]
        cell.appSectionLabel.text = group.feed.title
        cell.horizontalController.appGroup = group
        cell.horizontalController.collectionView.reloadData()
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 16, left: 0, bottom: 0, right: 0)
    }
    
    // STEP 2 : Override this method to deque a reusable suplementatry view
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath) as! AppsPageHeaderView
        
        header.appHeaderhorizontalController.socialApps = self.socialApps
        header.appHeaderhorizontalController.collectionView.reloadData()
        
        return header
    }
    
    // STEP 3 : Set the header size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

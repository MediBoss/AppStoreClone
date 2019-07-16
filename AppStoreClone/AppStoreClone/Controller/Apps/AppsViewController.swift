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
    var editorChoiceApps: AppGroup?
//    var fetchedAppFeeds = AppGroup(){
//        didSet{
//            DispatchQueue.main.async { [ weak self] in
//
//                guard let self = self else { return }
//                self.collectionView.reloadData()
//            }
//        }
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .white
        
        collectionView.register(AppsGroupsCell.self, forCellWithReuseIdentifier: AppsGroupsCell.cellID)
        
        // STEP 1 : Register CollectionReusableView
        collectionView.register(AppsPageHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerId)
        
        fetchAppGroups()
    }
    
    
    private func fetchAppGroups() {
        
        AppSearchService.shared.fetchEditorApps { (result) in
            
            switch result{
            case let .success(appgroup):
                self.editorChoiceApps = appgroup
                
                DispatchQueue.main.async { [ weak self] in
    
                    guard let self = self else { return }
                    self.collectionView.reloadData()
                }
            case .failure(_):
                print("oops")
            }
        }
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AppsGroupsCell.cellID, for: indexPath) as! AppsGroupsCell
        
        cell.appSectionLabel.text = editorChoiceApps?.feed.title
        cell.horizontalController.appGroup = editorChoiceApps
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
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerId, for: indexPath)
        
        return header
    }
    
    // STEP 3 : Set the header size
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: view.frame.width, height: 300)
    }
}

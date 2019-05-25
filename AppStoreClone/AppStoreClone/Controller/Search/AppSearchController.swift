//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AppSearchController: BaseUICollectionViewList, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate var throttleTimer: Timer?
    fileprivate var appSearchResults = [ResultType]()
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
    fileprivate let enterSearchTermLabel: UILabel = {
       
        let label = UILabel()
        label.text = "Enter a search term above"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        view.addSubview(enterSearchTermLabel)
        enterSearchTermLabel.fillSuperview()
        collectionView.register(SearchResultCell.self, forCellWithReuseIdentifier: SearchResultCell.cellID)
        setUpSearchBar()
    }
    
    /// Configures and Styles the search bar
    fileprivate func setUpSearchBar() {
        
        definesPresentationContext = true
        navigationItem.searchController = self.searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        self.searchController.dimsBackgroundDuringPresentation = false
        self.searchController.searchBar.delegate = self
    }
    
    // - MARK : UICollectionView Data Source & Delegate Methods
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        enterSearchTermLabel.isHidden = appSearchResults.count != 0
        return self.appSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellID, for: indexPath) as! SearchResultCell
        let currentResult = appSearchResults[indexPath.item]
        cell.appResult = currentResult
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
    
    
    // - MARK : UISearchBar Delegate Methods
    
    // Makes a call to the AppSearchServices that fetches data given a search query from the search bar.
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        throttleTimer?.invalidate()
        throttleTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
            // Search up a term every half a second, throttles the process if user input is faster than interval
            AppSearchService.shared.fetchApps(searchTerm: searchText) { (searchResult) in
                switch searchResult {
                case let .success(apps):
                    
                    self.appSearchResults = apps
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                    
                case let .failure(error):
                    print("error found : \(error)")
                }
            }
        })
    }
}

//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import UIKit

class AppSearchController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    fileprivate var throttleTimer: Timer?
    fileprivate var appSearchResults = [ResultType]()
    fileprivate var searchController = UISearchController(searchResultsController: nil)
    
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
        setUpSearchBar()
        //fetchItunesApps()
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
        
        // Search up a term every half a second, throttles the process if user input is faster than interval
        throttleTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { (_) in
            
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

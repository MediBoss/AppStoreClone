//
//  AppSearchController.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/20/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

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
        
        let urlString = "https://itunes.apple.com/search?term=instangram&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if err != nil {
                print("Error happened")
                return
            }
            
            guard let data = data else { return }
            
            do {
                
                let result = try JSONDecoder().decode(SearchResult.self, from: data)
                self.appSearchResults = result.results
                
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
                
            } catch let decodeError{
                print("Failed to decode JSON", decodeError)
            }
            
            
        }.resume()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.appSearchResults.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchResultCell.cellID, for: indexPath) as! SearchResultCell
        let currentResult = appSearchResults[indexPath.row]
        
        cell.appTitleLabel.text = currentResult.trackName
        cell.categoryLabel.text = currentResult.primaryGenreName
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width, height: 350)
    }
}

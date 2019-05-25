//
//  AppSearchService.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/22/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

class AppSearchService {
    
    static let shared = AppSearchService()
    
    func fetchApps(searchTerm: String, completion: @escaping (Result<[ResultType], Error>) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if err == nil {
                guard let data = data else { return }
                
                do {
                    
                    let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                    completion(.success(searchResult.results))
                    
                } catch let decodeError{
                    print("Failed to decode JSON", decodeError)
                }
            } else {
                completion(.failure(err!))
            }
            
        }.resume()
    }
}

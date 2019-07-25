//
//  AppSearchService.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/22/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation


enum FeedType: String{
    
    case topFree = "top-free"
    case topGrossing = "top-grossing"
    case newGames = "new-games-we-love"
    case topPaid = "top-paid"
}

class AppSearchService {
    
    static let shared = AppSearchService()
    
    private func createUrlForFeedType(type: FeedType) -> URL? {
        let urlString = "https://rss.itunes.apple.com/api/v1/us/ios-apps/\(type.rawValue)/all/50/explicit.json"
        return URL(string: urlString)
    }
    
    func fetchApps(searchTerm: String, completion: @escaping (SearchResult?, Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchByType(type: FeedType, completion: @escaping (AppGroup?, Error?) -> ()){
        
        guard let url = createUrlForFeedType(type: type) else { return }
        fetchGenericJSONData(urlString: url.absoluteString, completion: completion)
    }
    
    func fetchSocialApps(completion: @escaping([SocialApp]?, Error?) -> ()) {
        
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping (T?, Error?) -> ()){
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            
            if err == nil {
                guard let data = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(result, nil)
                    
                } catch let decodeError{
                    print("Failed to decode JSON", decodeError)
                }
            } else {
                completion(nil, err)
            }
            
        }.resume()
    }
}

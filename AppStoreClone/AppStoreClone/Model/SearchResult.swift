//
//  SearchResult.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 5/22/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

struct ResultType: Decodable{
    
    let trackName: String
    let primaryGenreName: String
    let averageUserRating: Float?
    let screenshotUrls: [String]
    let artworkUrl100: String
}

struct SearchResult: Decodable {
    
    let resultCount: Int
    let results: [ResultType]
}


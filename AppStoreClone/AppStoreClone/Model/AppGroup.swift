//
//  AppGroup.swift
//  AppStoreClone
//
//  Created by Medi Assumani on 7/16/19.
//  Copyright © 2019 Medi Assumani. All rights reserved.
//

import Foundation

struct AppGroup: Decodable {
    
    let feed: Feed
}

struct Feed: Decodable {
    
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    
    let name: String
    let artistName: String
    let artworkUrl100: String
}

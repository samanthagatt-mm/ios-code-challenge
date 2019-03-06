//
//  SearchResult.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchResult: Decodable {
    var artworkUrl100: String?
    var trackName: String?
    var collectionName: String?
    var artistName: String?
}

struct SearchResults: Decodable {
    var results: [SearchResult]
}

//
//  Album.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct Album: Decodable {
    let results: [Song]
}

struct Song: Decodable {
    let wrapperType: String?
    let trackName: String?
    let trackNumber: Int?
    let primaryGenreName: String?
    let releaseDate: String?
    var collectionName: String?
    var artistName: String?
}

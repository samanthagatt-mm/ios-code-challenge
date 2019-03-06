//
//  AlbumViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

struct AlbumViewModel {
    
    static var title: String?
    static var genre: String?
    static var year: String?
    static var artist: String?
    static var songs: [Song] = []
    static var imageNumber: Int?
    static var image: UIImage? {
        return SearchResultViewModel.images[AlbumViewModel.imageNumber ?? 0]
    }
    
    static func setAlbum(_ album: Album) {
        AlbumViewModel.songs = album.results.filter( { $0.wrapperType == "track" } )
        // Should only be one
        let albumInfo = album.results.filter( {$0.wrapperType == "collection"} ).first
        AlbumViewModel.genre = albumInfo?.primaryGenreName
        AlbumViewModel.year = String(albumInfo?.releaseDate?.prefix(4) ?? "")
        AlbumViewModel.title = albumInfo?.collectionName
        AlbumViewModel.artist = albumInfo?.artistName
    }
    
    static func setImageNumber(_ number: Int) {
        AlbumViewModel.imageNumber = number
    }
}

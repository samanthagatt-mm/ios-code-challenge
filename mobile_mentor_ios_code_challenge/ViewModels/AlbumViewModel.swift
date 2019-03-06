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
    static var image: UIImage?
    
    static func setAlbum(_ album: Album) {
        AlbumViewModel.songs = album.results.filter( { $0.wrapperType == "track" } )
        // Should only be one
        let albumInfo = album.results.filter( {$0.wrapperType == "collection"} ).first
        AlbumViewModel.genre = albumInfo?.primaryGenreName
        AlbumViewModel.year = String(albumInfo?.releaseDate?.prefix(4) ?? "")
        AlbumViewModel.title = albumInfo?.collectionName
        AlbumViewModel.artist = albumInfo?.artistName
    }
    
    static func setImage(_ image: UIImage?) {
        AlbumViewModel.image = image
    }
}

//
//  NetworkHelper.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import UIKit

class NetworkHelper {
    
    static let urlString = "https://itunes.apple.com"
    
    static func search(by term: String, completion: @escaping (_ success: Bool) -> Void) {
        
        var components = URLComponents(string: NetworkHelper.urlString)
        components?.path = "/search"
        let searchQuery = URLQueryItem(name: "term", value: term.replacingOccurrences(of: " ", with: "+"))
        components?.queryItems = [searchQuery]
        
        guard let searchURL = components?.url else {
            NSLog("Error constructing search url for \(term)")
            completion(false)
            return
        }
        let request = URLRequest(url: searchURL)
        
        URLSession.shared.dataTask(with: request) { (data, status, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    NSLog("Error searching for \(term): \(error)")
                    completion(false)
                    return
                }
                
                guard let data = data else {
                    NSLog("No data returned from search with term: \(term)")
                    completion(false)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(SearchResults.self, from: data)
                    SearchResultViewModel.results = result.results
                    SearchHistoryViewModel.addSearch(term: term)
                    completion(true)
                    
                } catch {
                    NSLog("Error decoding search results for \(term): \(error)")
                    completion(false)
                    return
                }
            }
            
        }.resume()
    }
    
    static func getImage(urlString: String, completion: @escaping (UIImage?) -> Void ) {
        
        guard let url = URL(string: urlString) else {
            NSLog("Error constructing the url for \(urlString)")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, status, error) in
            DispatchQueue.main.async {
                if let error = error {
                    NSLog("Error fetching image from \(urlString): \(error)")
                    completion(nil)
                    return
                }
                
                guard let data = data else {
                    NSLog("No image data returned from \(urlString)")
                    completion(nil)
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    NSLog("Error decoding image from \(urlString)")
                    completion(nil)
                    return
                }
                
                completion(image)
            }
            
        }.resume()
    }
    
    static func fetch(_ albumID: Int, completion: @escaping (Bool) -> Void ) {
        var components = URLComponents(string: NetworkHelper.urlString)
        components?.path = "/lookup"
        let idQuery = URLQueryItem(name: "id", value: String(albumID))
        let songQuery = URLQueryItem(name: "entity", value: "song")
        components?.queryItems = [idQuery, songQuery]
        
        guard let lookupURL = components?.url else {
            NSLog("Error constructing lookup url for album \(albumID)")
            completion(false)
            return
        }
        let request = URLRequest(url: lookupURL)
        
        URLSession.shared.dataTask(with: request) { (data, status, error) in
            
            DispatchQueue.main.async {
                if let error = error {
                    NSLog("Error looking up album \(albumID): \(error)")
                    completion(false)
                    return
                }
                
                guard let data = data else {
                    NSLog("No data returned from album \(albumID) lookup")
                    completion(false)
                    return
                }
                
                do {
                    // Fix later
                    let album = try JSONDecoder().decode(Album.self, from: data)
                    AlbumViewModel.setAlbum(album)
                    completion(true)
                    
                } catch {
                    NSLog("Error decoding lookup results for album \(albumID): \(error)")
                    completion(false)
                    return
                }
            }
            
        }.resume()
    }
}

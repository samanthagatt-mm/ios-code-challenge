//
//  NetworkHelper.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/5/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

class NetworkHelper {
    
    static let urlString = "https://itunes.apple.com/search"
    
    static func search(by term: String, completion: @escaping (_ success: Bool) -> Void) {
        
        var components = URLComponents(string: NetworkHelper.urlString)
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
}

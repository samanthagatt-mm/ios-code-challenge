//
//  SearchHistoryViewModel.swift
//  mobile_mentor_ios_code_challenge
//
//  Created by Samantha Gatt on 3/6/19.
//  Copyright © 2019 Elite Endurance Louisville. All rights reserved.
//

import Foundation

struct SearchHistoryViewModel {
    static var history: [(term: String, date: Date)] {
        var searches: [(term: String, date: Date)] = []
        for search in SearchHistory.history[UserAccountViewModel.userID ?? 0] ?? [:] {
            searches.append((term: search.key, date: search.value))
        }
        searches.sort(by: { $0.date < $1.date })
        return searches
    }
    
    static func addSearch(term: String, date: Date = Date()) {
        if var dict = SearchHistory.history[UserAccountViewModel.userID ?? 0] {
            dict[term] = date
            SearchHistory.history[UserAccountViewModel.userID ?? 0] = dict
        } else {
            SearchHistory.history[UserAccountViewModel.userID ?? 0] = [term: date]
        }
    }
    
    static func clearHistory() {
        SearchHistory.history[UserAccountViewModel.userID ?? 0] = nil
    }
}

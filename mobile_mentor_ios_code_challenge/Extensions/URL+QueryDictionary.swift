//
//  URL+QueryDictionary.swift
//  Open through URL
//
//  Created by Samantha Gatt on 4/11/19.
//  Copyright © 2019 Samantha Gatt. All rights reserved.
//

import Foundation

extension URL {
    var queryDictionary: [String: String] {
        var queries: [String: String] = [:]
        guard let query = query else { return queries }
        for urlQuery in query.components(separatedBy: "&") {
            let keyValueArray = urlQuery.components(separatedBy: "=")
            let keyOpt = keyValueArray.first
            let valueOpt = keyValueArray
                .last?
                .replacingOccurrences(of: "+", with: " ")
                .removingPercentEncoding
            guard let key = keyOpt, let value = valueOpt else { continue }
            queries[key] = value
        }
        return queries
    }
}

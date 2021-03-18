//
//  Endpoint.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import Foundation

struct Endpoint {

    var path: String
    var queryItems: [URLQueryItem] = []
    var host: String
}

extension Endpoint {

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = "/api/2/streams/symbol" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }

        return url
    }
}

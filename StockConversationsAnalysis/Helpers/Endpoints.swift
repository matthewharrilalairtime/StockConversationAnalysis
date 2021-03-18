//
//  Endpoints.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import Foundation

extension Endpoint {

    static func messages(symbol: String) -> Self {
        return Endpoint(path: "/\(symbol)", host: "api.stocktwits.com")
    }
}

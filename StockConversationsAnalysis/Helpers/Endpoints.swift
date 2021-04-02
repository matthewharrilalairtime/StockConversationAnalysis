//
//  Endpoints.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import Foundation

extension Endpoint {

    static func messages(symbol: String) -> Self {
        return Endpoint(path: "/\(symbol)", host: "api.stocktwits.com/api/2/streams/symbol")
    }

    static func symbols() -> Self {
        return Endpoint(path: "/api/v3/search", queryItems: [
            URLQueryItem(name: "query", value: "AA"),
            URLQueryItem(name: "exchange", value: "NASDAQ"),
            URLQueryItem(name: "apikey", value: "demo")
        ], host: "financialmodelingprep.com")
    }
}

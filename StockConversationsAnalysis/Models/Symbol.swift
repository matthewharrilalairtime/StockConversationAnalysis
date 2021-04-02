//
//  Symbol.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 4/2/21.
//

import Foundation
import Combine

struct Symbols: CustomStringConvertible, Codable {

    let symbols: [Symbol]
}

struct Symbol: CustomStringConvertible, Codable {

    let symbol: String?
    let name: String?
}

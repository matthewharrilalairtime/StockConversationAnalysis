//
//  Message.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import Foundation

struct Messages: CustomStringConvertible, Codable {
    let messages: [Message]
}

struct Message: CustomStringConvertible, Codable {
    let id: Int
    let body: String
}

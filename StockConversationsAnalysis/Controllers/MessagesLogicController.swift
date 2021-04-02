//
//  LogicController.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import Foundation
import Combine

protocol MessagesLogicControllerProtocol: class {
    func getMessages() -> AnyPublisher<Messages, Error>
}

final class MessagesLogicController: MessagesLogicControllerProtocol {

    let networkController: NetworkController

    init(networkController: NetworkController) {
        self.networkController = networkController
    }

    func getMessages() -> AnyPublisher<Messages, Error> {
        let endpoint = Endpoint.messages(symbol: "AAPL.json")

        return networkController.get(type: Messages.self, url: endpoint.url, headers: nil)
    }

    func getSymbols() -> AnyPublisher<[Symbol], Error> {
        let endpoint = Endpoint.symbols()

        return networkController.get(type: [Symbol].self, url: endpoint.url, headers: nil)
    }
}

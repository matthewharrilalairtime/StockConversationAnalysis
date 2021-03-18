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

    var networkController: NetworkControllerProtocol

    init(networkController: NetworkControllerProtocol) {
        self.networkController = networkController
    }

    func getMessages() -> AnyPublisher<Messages, Error> {
        let endpoint = Endpoint.messages(symbol: "OCGN.json")

        return networkController.get(type: Messages.self, url: endpoint.url, headers: nil)
    }
}

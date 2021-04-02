//
//  SymbolsViewController.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 4/2/21.
//

import Foundation
import UIKit
import Combine

class SymbolsViewController: UIViewController {

    private let networkController = NetworkController()
    private lazy var messagesLogicController = MessagesLogicController(networkController: networkController)

    private var subscriptions: AnyCancellable?


    override func viewDidLoad() {
        super.viewDidLoad()

        getSymbols()
    }
}

private extension SymbolsViewController {

    func getSymbols() {
        subscriptions = messagesLogicController.getSymbols()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished:
                    print("Success")
                }
            }, receiveValue: { symbols in
                print(symbols)
            })
    }
}

//
//  ViewController.swift
//  StockConversationsAnalysis
//
//  Created by Matthew Harrilal on 3/17/21.
//

import UIKit
import Combine
import NaturalLanguage

class MessagesViewController: UIViewController {

    let networkController = NetworkController()

    private lazy var messagesLogicController = MessagesLogicController(networkController: networkController)

    var subscriptions = Set<AnyCancellable>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        fetchMessages()
    }
}

private extension MessagesViewController {

    func fetchMessages() {
        var messageThread: String = ""

        messagesLogicController.getMessages()
            .map { $0.messages.forEach {
                messageThread += " \($0.body)" // Aggregate all message threads into single string for easy analysis
            }}
            .sink { completion in
                switch completion {
                case .failure(let error): print(error)
                case .finished: break
                }

            } receiveValue: { [weak self] _ in
                print("")
                print(messageThread)
                print("")
                print(self?.processSentiment(message: messageThread))
            }
            .store(in: &subscriptions)
    }

    func processSentiment(message: String) -> Double {
        let tagger = NLTagger(tagSchemes: [.sentimentScore])
        tagger.string = message

        let (sentiment, _) = tagger.tag(at: message.startIndex, unit: .paragraph, scheme: .sentimentScore)
        let score = Double(sentiment?.rawValue ?? "0") ?? 0
        return score
    }
}

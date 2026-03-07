//
//  WebSocketService.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import Foundation
import Combine

class WebSocketService {

    static let shared = WebSocketService()

    private var webSocketTask: URLSessionWebSocketTask?
    private let subject = PassthroughSubject<String, Never>()

    var publisher: AnyPublisher<String, Never> {
        subject.eraseToAnyPublisher()
    }

    func connect() {
        let url = URL(string: "wss://ws.postman-echo.com/raw")!
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()

        receive()
    }

    func disconnect() {
        webSocketTask?.cancel()
    }

    func send(_ message: String) {
        webSocketTask?.send(.string(message)) { error in
            if let error = error {
                print(error)
            }
        }
    }

    private func receive() {
        webSocketTask?.receive { [weak self] result in
            switch result {
            case .success(let message):
                if case .string(let text) = message {
                    self?.subject.send(text)
                }
            case .failure(let error):
                print(error)
            }

            self?.receive()
        }
    }
}

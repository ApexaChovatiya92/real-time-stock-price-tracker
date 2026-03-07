//
//  AppStore.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import Foundation
import Combine

class AppStore: ObservableObject {

    @Published var stocks: [Stock] = []
    @Published var isConnected: Bool = false
    @Published var isRunning: Bool = false

    private let socket = WebSocketService.shared
    private var cancellables = Set<AnyCancellable>()

    init() {
        setupStocks()
        bindSocket()
    }

    private func setupStocks() {
        let symbols = [
            "AAPL","GOOG","TSLA","AMZN","MSFT","NVDA","META",
            "NFLX","INTC","AMD","ORCL","IBM","BABA","SAP",
            "SHOP","ADBE","CRM","PYPL","SQ","UBER","LYFT",
            "SNAP","TWTR","DIS","SONY"
        ]

        stocks = symbols.map {
            Stock(symbol: $0, price: Double.random(in: 100...500), previousPrice: 0)
        }
    }

    private func bindSocket() {
        socket.publisher
            .sink { [weak self] message in
                self?.handle(message)
            }
            .store(in: &cancellables)
    }

    func startFeed() {

        isRunning = true
        socket.connect()
        isConnected = true

        Timer.publish(every: 2, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.generateUpdates()
            }
            .store(in: &cancellables)
    }

    func stopFeed() {
        socket.disconnect()
        isConnected = false
        isRunning = false
    }

    private func generateUpdates() {

        for index in stocks.indices {

            let newPrice = Double.random(in: 100...500)

            let message = "\(stocks[index].symbol):\(newPrice)"
            socket.send(message)
        }
    }

    func handle(_ message: String) {

        let parts = message.split(separator: ":")

        guard parts.count == 2 else { return }

        let symbol = String(parts[0])
        let price = Double(parts[1]) ?? 0

        guard let index = stocks.firstIndex(where: { $0.symbol == symbol }) else { return }

        stocks[index].previousPrice = stocks[index].price
        stocks[index].price = price

        stocks.sort { $0.price > $1.price }
    }
}

//
//  ContentView.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import SwiftUI

struct FeedView: View {

    @EnvironmentObject var store: AppStore

    var body: some View {

        NavigationStack {

            List(store.stocks) { stock in

                NavigationLink(value: stock.symbol) {
                    StockRowView(stock: stock)
                }
            }
            .navigationTitle("Stocks")

            .toolbar {

                ToolbarItem(placement: .navigationBarLeading) {

                    Circle()
                        .fill(store.isConnected ? .green : .red)
                        .frame(width: 12, height: 12)
                }

                ToolbarItem(placement: .navigationBarTrailing) {

                    Button(store.isRunning ? "Stop" : "Start") {

                        store.isRunning
                        ? store.stopFeed()
                        : store.startFeed()
                    }
                }
            }

            .navigationDestination(for: String.self) { symbol in
                StockDetailView(symbol: symbol)
            }
        }
    }
}

#Preview {
    FeedView()
}

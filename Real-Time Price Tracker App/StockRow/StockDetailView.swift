//
//  StockDetailView.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import SwiftUI

struct StockDetailView: View {

    @EnvironmentObject var store: AppStore

    let symbol: String

    var stock: Stock? {
        store.stocks.first { $0.symbol == symbol }
    }

    var body: some View {

        VStack(spacing: 20) {

            if let stock {

                Text(stock.symbol)
                    .font(.largeTitle)

                Text(String(format: "%.2f", stock.price))
                    .font(.title)

                Image(systemName: stock.isUp ? "arrow.up" : "arrow.down")
                    .foregroundColor(stock.isUp ? .green : .red)

                Text("This stock represents \(stock.symbol) company.")
            }
        }
        .padding()
    }
}

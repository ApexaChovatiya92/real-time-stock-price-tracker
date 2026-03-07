//
//  StockTrackerTests.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//


import XCTest
@testable import Real_Time_Price_Tracker_App

final class StockTrackerTests: XCTestCase {

    func testPriceDirectionIncrease() {
        
        let stock = Stock(symbol: "AAPL", price: 200, previousPrice: 180)
        
        XCTAssertTrue(stock.isUp)
    }

    func testPriceDirectionDecrease() {
        
        let stock = Stock(symbol: "AAPL", price: 150, previousPrice: 180)
        
        XCTAssertFalse(stock.isUp)
    }
    func testStockSorting() {
        
        var stocks = [
            Stock(symbol: "AAPL", price: 100, previousPrice: 90),
            Stock(symbol: "GOOG", price: 300, previousPrice: 290),
            Stock(symbol: "TSLA", price: 200, previousPrice: 180)
        ]

        stocks.sort { $0.price > $1.price }

        XCTAssertEqual(stocks.first?.symbol, "GOOG")
    }
    
    func testMessageParsing() {
        
        let message = "AAPL:187.45"
        
        let parts = message.split(separator: ":")

        let symbol = String(parts[0])
        let price = Double(parts[1])

        XCTAssertEqual(symbol, "AAPL")
        XCTAssertEqual(price, 187.45)
    }
    
    func testStockPriceUpdate() {

        let store = AppStore()

        store.stocks = [
            Stock(symbol: "AAPL", price: 100, previousPrice: 90)
        ]

        store.handle("AAPL:200")

        XCTAssertEqual(store.stocks.first?.price, 200)
    }
}

//
//  Stock.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import Foundation

struct Stock: Identifiable, Codable {
    let id = UUID()
    let symbol: String
    var price: Double
    var previousPrice: Double
    
    var isUp: Bool {
        price >= previousPrice
    }
}

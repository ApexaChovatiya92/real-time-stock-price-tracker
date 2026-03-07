//
//  Real_Time_Price_Tracker_AppApp.swift
//  Real-Time Price Tracker App
//
//  Created by apexa Chovatiya on 06/03/26.
//

import SwiftUI

@main
struct Real_Time_Price_Tracker_AppApp: App {
    @StateObject var store = AppStore()

    var body: some Scene {
        WindowGroup {
            FeedView().environmentObject(store)
        }
    }
}

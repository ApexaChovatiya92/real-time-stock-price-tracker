# Real-Time Price Tracker App (SwiftUI)

A real-time stock price tracking iOS application built using SwiftUI, Combine, and WebSockets. The app displays live price updates for multiple stock symbols and provides a detailed screen for each symbol.

This project demonstrates modern iOS architecture, reactive programming with Combine, and real-time data streaming.

## Features
### Live Price Tracking

Tracks 25 stock symbols (AAPL, GOOG, TSLA, AMZN, MSFT, NVDA, etc.)

Prices update every 2 seconds

Uses a WebSocket echo server to simulate real-time streaming

### Real-Time Feed Screen

Scrollable list of stock symbols.

Each row displays:

Stock symbol

Current price

Price change indicator (↑ / ↓)

Additional behavior:

Stocks are sorted by highest price

### Symbol Detail Screen

Tap any stock to open a detail view.

Displays:

Symbol name

Current price

Price direction indicator

Short description

### Connection Status

Top-left indicator shows the WebSocket connection state:

🟢 Connected

🔴 Disconnected

### Feed Controls

A Start / Stop button allows users to control the real-time price feed.

## Technical Stack

SwiftUI – UI framework

Combine – reactive data streams

WebSocket – real-time communication

MVVM Architecture

NavigationStack – navigation management

ObservableObject / @Published – reactive UI updates

## Architecture

The project follows MVVM architecture with a shared application store to maintain a single source of truth.

App
│
├── Models
│   └── Stock.swift
│
├── Services
│   └── WebSocketService.swift
│
├── Store
│   └── AppStore.swift
│
├── Views
│   ├── FeedView.swift
│   ├── StockRowView.swift
│   └── StockDetailView.swift
│
└── App Entry
    └── StockTrackerApp.swift
## Components
### Models

Defines the stock data structure used throughout the application.

### WebSocket Service

Responsible for handling WebSocket communication:

Establishing the connection

Sending price update messages

Receiving echoed responses from the server

### AppStore

Acts as a shared state container responsible for:

Managing stock data

Handling price updates

Sorting stocks by price

Managing WebSocket connection state

### Views

SwiftUI views that observe the AppStore and render real-time updates in the UI.

### WebSocket Flow

The application connects to the WebSocket echo server:

wss://ws.postman-echo.com/raw

Flow:

Every 2 seconds, the app generates a random price update.

The update is sent to the WebSocket server.

The server echoes the message back.

The app parses the response and updates the UI.

Example message format:

AAPL:187.45

## Setup Instructions
1. Clone the Repository
git clone https://github.com/ApexaChovatiya92/real-time-stock-price-tracker.git
2. Open the Project

### Open the project in Xcode.

StockTracker.xcodeproj
3. Run the App

### Select a simulator or device and run:

Cmd + R
Requirements

iOS 16+

Xcode 15+

Swift 5.9+

### Author

Apexa Pambhar
Senior iOS Developer
Swift • SwiftUI • Combine • MVVM


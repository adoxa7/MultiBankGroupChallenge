# Real-Time Price Tracker

An iOS app built with SwiftUI that displays live price updates for 25 stock symbols via a WebSocket echo server.

---

## Features

- **Live price feed** - 25 symbols updating every 2 seconds
- **WebSocket echo** - prices are sent to `wss://ws.postman-echo.com/raw`, echoed back, and applied to the UI
- **Sorted list** - symbols always ordered by current price, highest first
- **Price change indicators** - green ↑ / red ↓ arrows reflect the last movement
- **Symbol details** - tap any row to see the full company name, live price, and description
- **Connection status** - top-left indicator reflects Connected / Connecting / Disconnected
- **Start / Stop** - toggle the feed at any time from the top-right button

---

## Architecture

MVVM with Combine for reactive data flow and a Swift `actor` for the network layer.

```
ContentView  (@StateObject FeedViewModel)
└── FeedView  (@EnvironmentObject)
    ├── StockRowView 
    └── StockDetailView 

FeedViewModel  (ObservableObject)
├── Timer — fires every 2s, generates random ±5% prices
├── Subscribes to WebSocketService.messagePublisher
└── Sorts stocks by price after each echo

WebSocketService  (actor)
├── URLSessionWebSocketTask
├── async/await receive loop
├── nonisolated messagePublisher  → Combine stream of echo messages
└── nonisolated disconnectSubject → signals connection loss
```

---


## How to Run

1. Clone the repository
2. Open `MultiBankGroupChallenge.xcodeproj`
3. Select an iOS simulator
4. `Cmd+R` to build and run
5. Tap **Start** to begin the live feed

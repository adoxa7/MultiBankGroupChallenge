//
//  FeedViewModel.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import Foundation
import Combine

final class FeedViewModel: ObservableObject {

    enum ConnectionStatus {
        case disconnected, connecting, connected
    }

    @Published var stocks: [Stock] = StockData.stocks
    @Published var isRunning: Bool = false
    @Published var connectionStatus: ConnectionStatus = .disconnected

    private let webSocketService = WebSocketService()
    private var cancellables: Set<AnyCancellable> = []
    private var timerCancellable: AnyCancellable?

    init() {
        webSocketService.messagePublisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] message in
                self?.handleEchoMessage(message)
            }
            .store(in: &cancellables)

        webSocketService.disconnectSubject
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self, self.isRunning else { return }
                self.connectionStatus = .disconnected
            }
            .store(in: &cancellables)
    }

    func start() {
        guard !isRunning else { return }
        connectionStatus = .connecting
        isRunning = true

        Task {
            await webSocketService.connect()
            connectionStatus = .connected
        }

        timerCancellable = Timer.publish(every: 2.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                self?.sendPriceUpdates()
            }
    }

    func stop() {
        timerCancellable?.cancel()
        timerCancellable = nil
        isRunning = false
        connectionStatus = .disconnected
        Task { await webSocketService.disconnect() }
    }

    // MARK: - Private

    private func sendPriceUpdates() {
        let messages = stocks.map { stock -> String in
            let newPrice = Double.random(in: stock.price * 0.95 ... stock.price * 1.05)
            return "{\"symbol\":\"\(stock.symbol)\",\"price\":\(String(format: "%.2f", newPrice))}"
        }
        Task { await webSocketService.sendAll(messages) }
    }

    private func handleEchoMessage(_ message: String) {
        guard
            let data = message.data(using: .utf8),
            let update = try? JSONDecoder().decode(PriceUpdate.self, from: data),
            let index = stocks.firstIndex(where: { $0.symbol == update.symbol })
        else { return }

        stocks[index].updatePrice(update.price)
    }

    private struct PriceUpdate: Decodable {
        let symbol: String
        let price: Double
    }
}

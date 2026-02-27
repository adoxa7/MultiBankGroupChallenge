
//
//  WebSocketService.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import Foundation
import Combine

actor WebSocketService {

    private let url = URL(string: "wss://ws.postman-echo.com/raw")!
    private var webSocketTask: URLSessionWebSocketTask?

    nonisolated let messageSubject = PassthroughSubject<String, Never>()
    nonisolated let disconnectSubject = PassthroughSubject<Void, Never>()

    nonisolated var messagePublisher: AnyPublisher<String, Never> {
        messageSubject.eraseToAnyPublisher()
    }

    func connect() {
        webSocketTask = URLSession.shared.webSocketTask(with: url)
        webSocketTask?.resume()
        Task { await receiveMessages() }
    }

    func disconnect() {
        webSocketTask?.cancel(with: .normalClosure, reason: nil)
        webSocketTask = nil
    }

    func sendAll(_ messages: [String]) {
        for message in messages {
            webSocketTask?.send(.string(message)) { error in
                if let error {
                    print("WebSocket send error: \(error.localizedDescription)")
                }
            }
        }
    }

    // MARK: - Private

    private func receiveMessages() async {
        while let task = webSocketTask {
            do {
                let message = try await task.receive()
                switch message {
                case .string(let text):
                    messageSubject.send(text)
                case .data(let data):
                    if let text = String(data: data, encoding: .utf8) {
                        messageSubject.send(text)
                    }
                @unknown default:
                    break
                }
            } catch {
                print("WebSocket receive error: \(error.localizedDescription)")
                disconnectSubject.send()
                return
            }
        }
    }
}

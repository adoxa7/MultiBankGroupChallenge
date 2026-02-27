//
//  FeedView.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import SwiftUI

struct FeedView: View {

    @EnvironmentObject var viewModel: FeedViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.stocks) { stock in
                NavigationLink(value: stock) {
                    StockRowView(stock: stock)
                }
            }
            .listStyle(.plain)
            .navigationTitle("Live Prices")
            .navigationDestination(for: Stock.self) { stock in
                StockDetailView(stock: stock)
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    ConnectionStatusView(status: viewModel.connectionStatus)
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button(viewModel.isRunning ? "Stop" : "Start") {
                        viewModel.isRunning ? viewModel.stop() : viewModel.start()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(viewModel.isRunning ? .red : .green)
                }
            }
        }
    }
}

//
//  StockDetailView.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import SwiftUI

struct StockDetailView: View {

    let symbol: String
    @EnvironmentObject var viewModel: FeedViewModel

    private var stock: Stock? {
        viewModel.stocks.first { $0.symbol == symbol }
    }

    var body: some View {
        Group {
            if let stock {
                ScrollView {
                    VStack(alignment: .leading, spacing: 24) {
                        VStack(alignment: .leading, spacing: 8) {
                            Text(stock.name)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)

                            HStack(alignment: .bottom, spacing: 8) {
                                Text(stock.price.formatted(.currency(code: "USD")))
                                    .font(.system(size: 44, weight: .bold, design: .monospaced))
                                Image(systemName: changeIcon(for: stock))
                                    .font(.title2)
                                    .foregroundStyle(changeColor(for: stock))
                                    .padding(.bottom, 6)
                            }
                        }

                        Divider()

                        VStack(alignment: .leading, spacing: 8) {
                            Text("About \(stock.symbol)")
                                .font(.headline)
                            Text(stock.description)
                                .font(.body)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding()
                }
            } else {
                ContentUnavailableView("Symbol not found", systemImage: "exclamationmark.triangle")
            }
        }
        .navigationTitle(symbol)
        .navigationBarTitleDisplayMode(.large)
    }

    private func changeIcon(for stock: Stock) -> String {
        switch stock.priceChange {
        case .up:        return "arrow.up.circle.fill"
        case .down:      return "arrow.down.circle.fill"
        case .unchanged: return "minus.circle.fill"
        }
    }

    private func changeColor(for stock: Stock) -> Color {
        switch stock.priceChange {
        case .up:        return .green
        case .down:      return .red
        case .unchanged: return .secondary
        }
    }
}

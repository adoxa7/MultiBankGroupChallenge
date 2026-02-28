//
//  StockRowView.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import SwiftUI

struct StockRowView: View {

    let stock: Stock

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            VStack(alignment: .leading, spacing: 2) {
                Text(stock.symbol)
                    .font(.headline)
                Text(stock.name)
                    .font(.caption)
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            HStack(alignment: .center, spacing: 4) {
                Image(systemName: changeIcon)
                    .font(.caption)
                    .foregroundStyle(changeColor)
                Text(stock.price.formatted(.currency(code: "USD")))
                    .font(.headline)
                    .monospacedDigit()
                    .foregroundStyle(changeColor)
            }
        }
        .padding(.vertical, 4)
    }

    private var changeIcon: String {
        switch stock.priceChange {
        case .up:        return "arrow.up"
        case .down:      return "arrow.down"
        case .unchanged: return "minus"
        }
    }

    private var changeColor: Color {
        switch stock.priceChange {
        case .up:        return .green
        case .down:      return .red
        case .unchanged: return .primary
        }
    }
}

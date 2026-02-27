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
            Text(stock.price.formatted(.currency(code: "USD")))
                .font(.headline)
                .monospacedDigit()
        }
        .padding(.vertical, 4)
    }
}

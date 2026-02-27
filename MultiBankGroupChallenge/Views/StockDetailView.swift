//
//  StockDetailView.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import SwiftUI

struct StockDetailView: View {

    let stock: Stock

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                VStack(alignment: .leading, spacing: 4) {
                    Text(stock.name)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    Text(stock.price.formatted(.currency(code: "USD")))
                        .font(.system(size: 44, weight: .bold, design: .monospaced))
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
        .navigationTitle(stock.symbol)
        .navigationBarTitleDisplayMode(.large)
    }
}

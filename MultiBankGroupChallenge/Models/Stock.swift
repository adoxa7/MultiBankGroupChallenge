//
//  Stock.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import Foundation

struct Stock: Identifiable, Hashable {
    let id: UUID
    let symbol: String
    let name: String
    let description: String
    var price: Double
    var previousPrice: Double

    var priceChange: PriceDirection {
        if price > previousPrice { return .up }
        if price < previousPrice { return .down }
        return .unchanged
    }

    enum PriceDirection {
        case up, down, unchanged
    }

    init(symbol: String, name: String, description: String, initialPrice: Double) {
        self.id = UUID()
        self.symbol = symbol
        self.name = name
        self.description = description
        self.price = initialPrice
        self.previousPrice = initialPrice
    }

    mutating func updatePrice(_ newPrice: Double) {
        previousPrice = price
        price = newPrice
    }
}

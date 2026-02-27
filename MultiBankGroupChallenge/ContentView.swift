//
//  ContentView.swift
//  MultiBankGroupChallenge
//
//  Created by Mamirova Akbota on 27.02.2026.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var viewModel = FeedViewModel()

    var body: some View {
        FeedView()
            .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}

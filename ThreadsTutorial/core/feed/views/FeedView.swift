//
//  FeedView.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 01/12/2025.
//

import SwiftUI

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false) {
                LazyVStack {
                    ForEach(viewModel.threads) { thread in
                        ThreadCell(thread: thread)
                    }
                }
            }
            .refreshable {
                Task {
                    try await viewModel.fetchThreads()
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        Task {
                            try await viewModel.fetchThreads()
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.black)
                    }
                }

            }
            .navigationTitle("Threads")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    FeedView()
}

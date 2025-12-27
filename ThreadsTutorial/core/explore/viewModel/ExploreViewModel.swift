//
//  ExploreViewModel.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 25/12/2025.
//

import Foundation
import Combine

class ExploreViewModel : ObservableObject {
    @Published var users: [User] = []
    
    
    init() {
        Task {
            try await fetchUsers()
        }
    }
    
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchUsers()
    }
}

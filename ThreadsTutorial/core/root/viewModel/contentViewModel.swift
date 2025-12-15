//
//  contentViewModel.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 15/12/2025.
//

import Foundation
import Combine
import FirebaseAuth

class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    private var cancellables = Set<AnyCancellable>()
    
    init () {
        self.setupSubscribers()
    }
    
    private func setupSubscribers() {
        // NOTE: Observing the user session in the AuthService
        AuthService.shared.$userSession.sink { [weak self] userSession in
            print("DEBUG: User email in content view model: \(userSession?.email)")
            self?.userSession = userSession
        }.store(in: &cancellables)
    }
}

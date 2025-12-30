//
//  CreateThreadViewModel.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 28/12/2025.
//

import Foundation
import Firebase
import Combine
import FirebaseAuth

class CreateThreadViewModel : ObservableObject {
    
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let thread = Thread(
            ownerUid: uid,
            timestamp: Timestamp(), // NOTE: Current date
            caption: caption,
            likes: 0
        )
        
        try await ThreadService.uploadThread(thread)
    }
}

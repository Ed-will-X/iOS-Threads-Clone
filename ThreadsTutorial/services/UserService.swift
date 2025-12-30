//
//  UserService.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 16/12/2025.
//

import Foundation
import Combine
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserService {
    @Published var currentUser: User?
    static let shared = UserService()
    
    init() {
        Task {
            try await fetchCurrentUser()
        }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("DEBUG: Auth user is null")
//            self.currentUser = nil
            return
        }
        
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        let user = try snapshot.data(as: User.self)
        self.currentUser = user
        
        print("DEBUG: user is \(user)")
    }
    
    static func fetchUsers() async throws -> [User] {
        guard let currentUID = Auth.auth().currentUser?.uid else {
            return []
        }
        
        let query = Firestore.firestore().collection("users")
        let snapshot = try await query.getDocuments()
        
        
        let users: [User] = try snapshot.documents.compactMap({ try? $0.data(as: User.self) })

        
        return users.filter({ $0.id != currentUID })
    }
    
    func reset() {
        self.currentUser = nil
    }
    
    @MainActor
    func updateUserProfileImage(withImageUrl imageUrl: String) async throws {
        guard let currentUID = Auth.auth().currentUser?.uid else {
            return
        }
        
        try await Firestore.firestore().collection("users").document(currentUID).updateData([
            "profileImageUrl": imageUrl
        ])
        
        self.currentUser?.profileImageUrl = imageUrl
    }
    
    static func fetchUser(withUid uid: String) async throws -> User {
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        
        return try snapshot.data(as: User.self)
    }
    

    
}



import Foundation
import FirebaseAuth
import Combine

class AuthService {
    // INFO: Used to keep track of whether user is logged in
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            print("DEBUG: Signed in \(result.user.uid)")
        } catch { // NOTE: Same as "catch let error"
            print("DEBUG: Failed to sign in \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullname: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            print("DEBUG: Created User \(result.user.uid)")
        } catch { // NOTE: Same as "catch let error"
            print("DEBUG: Failed to create user \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func signOut() {
        try? Auth.auth().signOut()
        self.userSession = nil
    }
}

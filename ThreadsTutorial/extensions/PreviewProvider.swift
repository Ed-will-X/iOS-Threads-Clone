//
//  PreviewProvider.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 25/12/2025.
//

import SwiftUI
import Firebase

extension PreviewProvider {
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview {
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullname: "Test Full Name", email: "nigga@gmail.com", username: "Test Username")
    let thread = Thread(ownerUid: "123", timestamp: Timestamp(), caption: "Test thread", likes: 10)
}

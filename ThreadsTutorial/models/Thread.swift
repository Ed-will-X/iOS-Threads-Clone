//
//  Thread.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 28/12/2025.
//

import Foundation
import Firebase
import FirebaseFirestore

struct Thread: Identifiable, Codable {
    @DocumentID var threadId: String?
    
    let ownerUid: String
    let timestamp: Timestamp
    let caption: String
    var likes: Int
    
    var user: User?
    
    var id: String {
        return threadId ?? NSUUID().uuidString
    }
    
}

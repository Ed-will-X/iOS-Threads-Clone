//
//  User.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 16/12/2025.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullname: String
    let email: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}

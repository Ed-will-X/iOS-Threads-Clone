//
//  ProfileThreadFilter.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 07/12/2025.
//

import Foundation

enum ProfileThreadFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
            case .threads: return "Threads"
            case .replies: return "Replies"
        }
    }
    
    // INFO There's an integer for each value under the hood. That's the raw value
    var id: Int { self.rawValue }
}

//
//  ThreadsTextFieldModifier.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 01/12/2025.
//

import SwiftUI


struct ThreadsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}

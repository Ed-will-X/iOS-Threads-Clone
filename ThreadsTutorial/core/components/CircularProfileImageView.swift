//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 07/12/2025.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("test-image")
            .resizable()
            .scaledToFill() 
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}

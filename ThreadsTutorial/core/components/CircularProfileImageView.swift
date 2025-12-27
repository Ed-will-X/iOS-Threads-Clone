//
//  CircularProfileImageView.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 07/12/2025.
//

import SwiftUI
import Kingfisher

struct CircularProfileImageView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        if let imageUrl = user?.profileImageUrl {
            KFImage(URL(string: imageUrl))
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        } else {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundStyle(Color(.systemGray4))
        }
    }
}

#Preview {
    CircularProfileImageView(user: DeveloperPreview.shared.user)
}

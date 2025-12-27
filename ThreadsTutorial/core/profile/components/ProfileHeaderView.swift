//
//  ProfileHeaderView.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 25/12/2025.
//

import SwiftUI

struct ProfileHeaderView: View {
    var user: User?
    
    init(user: User? = nil) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 12) {
                // Fullname and username
                VStack(alignment: .leading, spacing: 4) {
                    Text(user?.fullname ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text(user?.username ?? "")
                        .font(.subheadline)
                }
                
                // NOTE: Computed properties in swiftUI code
                if let bio = user?.bio {
                    Text(bio)
                }
                
                Text("2 Followers")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
            
            Spacer()
            
            CircularProfileImageView(user: user)
        }
    }
}

#Preview {
    ProfileHeaderView(user: DeveloperPreview.shared.user)
}

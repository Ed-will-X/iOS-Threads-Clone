//
//  ProfileView.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 01/12/2025.
//

import SwiftUI

struct ProfileView: View {
    let user: User

    
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(width: 352, height: 32)
                        .background(.black)
                        .cornerRadius(8)
                    
                }
                
                // User content
                UserContentListView(user: user)

            }
            
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
}

#Preview {
    ProfileView(user: DeveloperPreview.shared.user)
}

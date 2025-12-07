//
//  UserCell.swift
//  ThreadsTutorial
//
//  Created by Edmund Williams on 07/12/2025.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack {
            CircularProfileImageView()
            
            
            VStack(alignment: .leading) {
                Text("test_1_balls")
                    .fontWeight(.semibold)
                
                Text("Max Balls")
            }
            .font(.footnote)
            
            
            Spacer()
            
            Text("Follow")
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 100, height: 32)
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(.systemGray4), lineWidth: 1)
                }
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}

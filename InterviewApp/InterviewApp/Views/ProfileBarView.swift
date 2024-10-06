//
//  ProfileBarView.swift
//  InterviewApp
//
//

import SwiftUI

struct ProfileBarView: View {
    @StateObject private var viewModel = GitHubUserViewModel()    
    
    var body: some View {
        HStack {
            
            Spacer()
            if let user = viewModel.user {
                AsyncImage(url: URL(string: user.avatarUrl)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                } placeholder: {
                    Circle()
                        .foregroundColor(.secondary)
                }
            }
        }
        .onAppear {
            Task {
                await viewModel.fetchGitHubUserData(for: "mattmckeon")
            }
        }
        .background(
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
        )  
        .foregroundColor(.white)
    }
}

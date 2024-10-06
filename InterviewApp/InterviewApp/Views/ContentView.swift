//
//  ContentView.swift
//  InterviewApp
//
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GitHubUserViewModel()
    
    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 20) {
                if let user = viewModel.user {
                    
                    Text("HIRE!")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    AsyncImage(url: URL(string: user.avatarUrl)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .clipShape(Circle())
                    } placeholder: {
                        Circle()
                            .foregroundColor(.secondary)
                    }//.frame(width: 120, height: 120)
                    
                    Text(user.name ?? "Name Placeholder")
                        .bold()
                        .font(.largeTitle)
                }
                //Text(user?.bio ?? "Bio Placeholder")
            }
            .onAppear {
                Task {
                    await viewModel.fetchGitHubUserData(for: "jamalie")
                }
            }
            .padding()
            
            LottieView(filename: "confetti")
                .frame(width: 500, height: 500)  // Set the size of the Lottie animation
                .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                .ignoresSafeArea() // Make sure it extends beyond safe areas if needed
        }
    }
}


struct ContentViewPreview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


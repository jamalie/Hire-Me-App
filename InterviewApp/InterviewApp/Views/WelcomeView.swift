//
//  WelcomeView.swift
//  InterviewApp
//
//
import SwiftUI

struct WelcomeView: View {
    @StateObject private var viewModel = GitHubUserViewModel()
    @State private var isTimeUp: Bool = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ).opacity(0.4)
                
                VStack {
                    if let user = viewModel.user {
                        Text("Welcome back, \(user.name ?? "PlaceHolder Name")!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding()
                        
                        // Profile image from URL
                        AsyncImage(url: URL(string: user.avatarUrl)) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .padding()
                        } placeholder: {
                            // Placeholder while loading
                            Image(systemName: "person.crop.circle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .padding()
                        }
                        
                        Text("Loading your candidate dashboard...")
                            .font(.headline)
                            .padding()
                    }
                    
                    LoadingSpinnerView()
                    
                }
                .onAppear {
                    // Start the timer for 3 seconds to navigate to the next screen
                    Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { _ in
                        isTimeUp = true
                    }
                    Task {
                        await viewModel.fetchGitHubUserData(for: "mattmckeon")
                    }
                }
                .fullScreenCover(isPresented: $isTimeUp){
                    CandidateSelectionView()
                }
                
            }
        }
    }
}

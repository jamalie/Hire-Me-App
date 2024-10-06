//
//  GitHubUserDataViewModel.swift
//  InterviewApp
//
//

import SwiftUI
import Combine

// ViewModel for GitHub User Data
class GitHubUserViewModel: ObservableObject {
    @Published var user: GitHubUserData?
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let apiService: APIService
    
    // Initialize with APIService (dependency injection)
    init(apiService: APIService = APIService()) {
        self.apiService = apiService
    }
    
    // Function to fetch GitHub user data
    func fetchGitHubUserData(for username: String) async {
        isLoading = true
        errorMessage = nil
        do {
            let userData = try await apiService.getGitHubUserData(user: username)
            DispatchQueue.main.async {
                self.user = userData
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.isLoading = false
                self.errorMessage = "Failed to load user data"
            }
        }
    }
}

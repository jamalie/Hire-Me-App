//
//  APIService.swift
//  InterviewApp
//
//
import Foundation


struct APIService {
    
    func getGitHubUserData(user: String) async throws -> GitHubUserData {
        let endpoint = "https://api.github.com/users/\(user)"
        
        guard let url = URL(string: endpoint) else {
            throw GitHubError.InvalidURL
        };
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(GitHubUserData.self, from: data)
        } catch {
            throw GitHubError.InvalidData
        }
    }
}

enum GitHubError: Error {
    case InvalidURL
    case InvalidData
}

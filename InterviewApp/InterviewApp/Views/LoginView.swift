//
//  LoginView.swift
//  InterviewApp
//
//  Notes
//  @State is an attribute applied to a property declaration providing an initial value. Things marked with @state should typically cause swiftUI to re-render a part of the view to reflect the update
//  CGFloat is just a float, stores

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    // Trigger the red box around username field if incorrect user entered
    @State private var wrongUserName = 0
    @State private var password: String = ""
    @State private var wrongPassword = 0
    @State private var isLoggedIn = false
    @State private var showWelcomeView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.blue, .purple]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.3)
                    .foregroundColor(.white)
                VStack {
                    Text("Hire Me App")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    Text("Login")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    // Username TextField
                    // $username is a binding variable denoted by '$'
                    // This means when the text in the field changes, @state username above is also changed
                    TextField("Username", text: $username)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.gray.opacity(0.2))
                                .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:5)
                                .border(.red, width:CGFloat(wrongUserName))
                        )
                        .padding(.horizontal)
                    
                    
                    // Password SecureField
                    // SecureField obscures text
                    SecureField("Password", text: $password)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .fill(Color.gray.opacity(0.2))
                                .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:5)
                                .border(.red, width:CGFloat(wrongUserName))
                        )
                        .padding(.horizontal)
                    
                    // Log In Button
                    Button(action: {
                        authenticateUser()
                    }) {
                        Text("Log In")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    .padding(.top, 20)
                    
                }
                //  Navigate to Candidate Selection after "login"
                //  isLoggedIn is binding here
                .fullScreenCover(isPresented: $isLoggedIn) {
                    WelcomeView()
                    
                }
            }
        }
    }
    // Options for storing complex and/or large datasets include:
    // CoreData
    // SQLite DB
    // CloudKit
    // KeyChain (best for this use case)
    func authenticateUser(){
        if username.lowercased() == "mattm" {
            wrongUserName = 0
            if password.lowercased() == "password" {
                wrongPassword = 0
                isLoggedIn = true
            } else {
                wrongPassword = 2
            }
        }
        else{
            wrongUserName = 2
        }
    }
}

struct LoginViewPreview: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

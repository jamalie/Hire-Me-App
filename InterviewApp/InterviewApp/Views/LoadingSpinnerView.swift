//
//  LoadingSpinnerView.swift
//  InterviewApp
//
//

import SwiftUI

struct LoadingSpinnerView: View {
    var body: some View {
        VStack {
            ProgressView() // Default loading spinner
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5) // Adjust the size of the spinner
                .padding()
        }
    }
}

//
//  CandidateRow.swift
//  InterviewApp
//
//

import SwiftUI

struct CandidateRow: View {
    var name: String
    var status: String
    var isSelectable: Bool
    
    var body: some View {
        HStack {
            Text(name)
                .font(.headline)
            
            Spacer()
            
            Text(status)
                .foregroundColor(isSelectable ? .blue : .green)
        }
        .padding()
        .background(
            ZStack {
                // Conditional background color based on isSelectable
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(isSelectable ? Color.blue.opacity(0.1) : Color.gray.opacity(0.1))
                
                // Rounded background with shadow
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .strokeBorder(Color.white, lineWidth: 0) // No stroke border but ensures layering order
                    .shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 5)
            }
        )
        .padding(.horizontal)
    }
}

struct CandidateRow_Previews: PreviewProvider {
    static var previews: some View {
        CandidateRow(name: "Jamalie Thenor", status: "Pending", isSelectable: true)
    }
}

//
//  CandidateSelectionView.swift
//  InterviewApp
//
//  Notes
//  NavigationView is required for navigationLink to work

import SwiftUI

struct CandidateSelectionView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                ProfileBarView()
                
                Spacer()
                
                Text("CandidateList")
                    .font(.largeTitle)
                    .padding()
                
                Text("Complete all evaluations to proceed")
                    .font(.subheadline)
                    .padding()
                
                List {
                    CandidateRow(name: "Anita Job", status: "Complete", isSelectable: false)
                    CandidateRow(name: "Justin Time", status: "Complete", isSelectable: false)
                    CandidateRow(name: "Will Workhard", status: "Complete", isSelectable: false)
                    
                    NavigationLink(destination: SurveyView()) {
                        CandidateRow(name: "Jamalie Thenor", status: "Pending", isSelectable: true)
                    }
                }
                .listStyle(PlainListStyle())
            }
        }
    }
}

struct CandidateSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CandidateSelectionView()
    }
}

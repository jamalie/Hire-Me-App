//
//  SurveyView.swift
//  InterviewApp
//
//

import SwiftUI

struct SurveyView: View {
    // State variables to store the answer for each question
    @State private var question1: Int = 1
    @State private var question2: Int = 1
    @State private var question3: Int = 1
    @State private var question4: Int = 1
    @State private var question5: Int = 1

    @State private var showResult = false // To show the result screen when submitted

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [.blue, .purple]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ).opacity(0.4)
            ScrollView {
                VStack(spacing: 20) {
                    Text("Candidate Evaluation")
                        .font(.largeTitle)
                        .padding(.top)
                    
                    // Survey Questions
                    SurveyQuestionView(question: "Has the candidate shown initiative?", selection: $question1)
                    SurveyQuestionView(question: "Does the candidate stand out from other candidates?", selection: $question2)
                    SurveyQuestionView(question: "Does the candidate display a passion for the role", selection: $question3)
                    SurveyQuestionView(question: "Does the candidate exhibit creativity and curiosity?", selection: $question4)
                    SurveyQuestionView(question: "Is the candidate a self starter?", selection: $question5)
                    
                    Spacer()
                    
                    // Submit Button
                    Button(action: {
                        showResult = true
                    }) {
                        Text("Submit Evaluation")
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 30)
                }
                .navigationBarBackButtonHidden(true)
                .fullScreenCover(isPresented: $showResult) {
                    CalculationView() // Result view after submitting the survey
                }
                .padding()
            }
        }
    }
}

struct SurveyQuestionView: View {
    var question: String
    @Binding var selection: Int // Binding allows two-way data flow

    var body: some View {
        VStack(alignment: .leading) {
            Text(question)
                .font(.headline)
                .fixedSize(horizontal: false, vertical: true)

            // Picker for the scale options (Strong, Stronger, Strongest, God)
            Picker("Select an option", selection: $selection) {
                Text("Yes").tag(1)
                Text("Strong Yes").tag(2)
                Text("Absolutely").tag(3)
                Text("Hire Now").tag(4)
            }
            .pickerStyle(SegmentedPickerStyle()) // Segmented control style
            .padding(.vertical)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(Color.white)
                .shadow(color: .gray.opacity(0.5), radius: 10, x:0, y:5)
        )
    }
}

struct SurveyView_Previews: PreviewProvider {
    static var previews: some View {
        SurveyView()
    }
}

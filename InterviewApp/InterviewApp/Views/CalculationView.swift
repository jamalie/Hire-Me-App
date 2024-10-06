//
//  CalculationView.swift
//  InterviewApp
//
//
import SwiftUI

struct CalculationView : View {
    @State private var isTimeUp: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Calculating Best Fit")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                
                LottieView(filename: "calculation")
                    .frame(width: 500, height: 500)  // Set the size of the Lottie animation
                    .position(x: UIScreen.main.bounds.width / 2, y: UIScreen.main.bounds.height / 2)
                    .ignoresSafeArea()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 8.0, repeats: false) { _ in
                isTimeUp = true
            }
        }
        .fullScreenCover(isPresented: $isTimeUp){
            ContentView()
        }
    }
}

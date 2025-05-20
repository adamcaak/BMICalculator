//
//  ResultView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 13/05/2025.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: BMIViewModel
        
        var body: some View {
            VStack(spacing: 20) {
                Text("Wynik BMI")
                    .font(.largeTitle)
                    .bold()
                
                Text(String(format: "Twoje BMI to: %.1f", viewModel.bmi))
                    .padding()
                    .font(.title3)
                
                Text(viewModel.resultText.text)
                    .font(.headline)
                    .foregroundColor(viewModel.resultText.color)
                
                BMIGraphView(bmi: viewModel.bmi)
                
                Button("Reset") {
                    viewModel.reset()
                }
                .padding()
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(10)
            }
            .padding()
        }
}

#Preview {
    ResultView(viewModel: {
            let vm = BMIViewModel()
            vm.weight = "70"
            vm.height = "180"
            vm.gender = "MEN"
            vm.showResult = true
            return vm
        }())
}

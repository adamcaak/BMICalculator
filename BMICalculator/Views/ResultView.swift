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
            
            Text(String(format: "Twoje BMI to: %.1f", viewModel.scoreBMI))
                .padding()
                .font(.title3)
            
            let result = BMIResult(bmi: viewModel.scoreBMI, gender: viewModel.gender)
            let description = viewModel.gender == "MEN" ?
                result.interpolationForMen() :
                viewModel.gender == "WOMEN" ?
                result.interpolationForWomen() :
                ("Nie wybrano płci", Color.gray)
            
            Text(description.0)
                .font(.headline)
                .foregroundColor(description.1)
            
            BMIGraphView(bmi: viewModel.scoreBMI)
            
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
    ResultPreviewWrapper()
}

struct ResultPreviewWrapper: View {
    @StateObject var viewModel = BMIViewModel()

    var body: some View {
        // Przykładowe dane do podglądu
        viewModel.weight = "70"
        viewModel.height = "180"
        viewModel.gender = "MEN"
        viewModel.scoreBMI = 21.6
        viewModel.showResult = true
        
        return ResultView(viewModel: viewModel)
    }
}

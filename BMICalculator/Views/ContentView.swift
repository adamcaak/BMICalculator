//
//  ContentView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 09/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BMIViewModel()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("BMI Calculator")
                    .font(.largeTitle)
                    .bold()
                    .padding(.bottom, 80)
                
                HStack(spacing: 30) {
                    genderButton(title: "MEN", selected: viewModel.gender == "MEN") {
                        viewModel.gender = "MEN"
                    }
                    genderButton(title: "WOMEN", selected: viewModel.gender == "WOMEN") {
                        viewModel.gender = "WOMEN"
                    }
                }
                
                TextField("Waga", text: $viewModel.weight)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(10)
                
                TextField("Wzrost", text: $viewModel.height)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(Color(.gray).opacity(0.2))
                    .cornerRadius(10)
                Button(action: {
                    viewModel.calculateBMI()
                }, label: {
                    Text("Oblicz BMI")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                })
                //                Button("Oblicz BMI") {
                //                    viewModel.calculateBMI()
                //                }
                //                .padding()
                //                .foregroundColor(.white)
                //                .background(Color.orange)
                //                .cornerRadius(10)
            }
            .padding()
        }
        .sheet(isPresented: $viewModel.showResult) {
            ResultView(viewModel: viewModel)
        }
    }
    
    private func genderButton(title: String, selected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(title)
                .padding()
                .frame(width: 100, height: 100)
                .background(selected ? Color.green : Color.orange)
                .cornerRadius(10)
                .foregroundColor(.white)
        }
    }
}
#Preview {
    ContentView()
}

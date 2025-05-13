//
//  ContentView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 09/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var scoreBMI: Double = 0.0
    @State private var selectGender: String = ""
    @State private var showResult: Bool = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("BMI Calculator")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                HStack(spacing: 30) {
                    Button(action: {
                        selectGender = "MEN"
                    }) {
                        Text("MEN")
                            .padding()
                            .frame(width: 100, height: 100)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    
                    Button(action: {
                        selectGender = "WOMEN"
                    }) {
                        Text("WOMEN")
                            .padding()
                            .frame(width: 100, height: 100)
                            .background(Color.orange)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                }
                TextField("Waga", text: $weight)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(Color(.gray).opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                TextField("Wzrost", text: $height)
                    .padding()
                    .keyboardType(.decimalPad)
                    .background(Color(.gray).opacity(0.2))
                    .foregroundColor(.black)
                    .cornerRadius(10)
                
                Button(action: {
                    if let weightValue = Double(weight), let heightValue = Double(height) {
                        let heightInMeters = heightValue / 100
                        let scoreBMI = weightValue / (heightInMeters * heightInMeters)
                        self.scoreBMI = scoreBMI
                    }
                }) {
                    Text("Oblicz BMI")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                Text(String(format: "Twoje BMI to: %.1f", scoreBMI))
                    .padding()
                    .font(.title3)
            }
            .padding()
        }
        .sheet(isPresented: $showResult) {
            ResultView(bmi: scoreBMI, gender: selectGender)
        }
    }
}

#Preview {
    ContentView()
}

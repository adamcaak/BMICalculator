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
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("BMI Calculator")
                    .font(.largeTitle)
                    .bold()
                    .padding()
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
                    //Logika
                    print("BMI")
                }) {
                    Text("Oblicz BMI")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

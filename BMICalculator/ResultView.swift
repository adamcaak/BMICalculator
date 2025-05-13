//
//  ResultView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 13/05/2025.
//

import SwiftUI

struct ResultView: View {
    @Binding var weight: String
    @Binding var height: String
    @Binding var scoreBMI: Double
    @Binding var selectGender: String
    @Binding var showResult: Bool
    
    let bmi: Double
    let gender: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wynik BMI")
                .font(.largeTitle)
                .bold()
            
            Text(String(format: "Twoje BMI to: %.1f", scoreBMI))
                .padding()
                .font(.title3)
            
            Button("Reset") {
                weight = ""
                height = ""
                scoreBMI = 0
                selectGender = ""
                showResult = false
            }
            .padding()
            .foregroundColor(.white)
            .background(Color.orange)
            .cornerRadius(10)
            
            
            if gender == "MEN" {
                Text("Interpolacja dla mężczyzn: \(interpolationForMen())")
            } else if gender == "WOMEN" {
                Text("Interpolacja dla kobiet: \(interpolationForWomen())")
            } else {
                Text("Nie wybrano płci")
            }
        }
        .padding()
    }
    
    func interpolationForMen() -> String {
        switch bmi {
        case ..<18.5:
            return "Niedowaga"
        case 18.5...24.9:
            return "Waga normalna"
        case 25...29.9:
            return "Nadwaga"
        case 30...34.9:
            return "Otyłość I stopnia"
        case 35...39.9:
            return "Otyłość II stopnia"
        default:
            return "Otyłość III stopnia"
        }
    }
    
    func interpolationForWomen() -> String {
        switch bmi {
        case ..<18.0:
            return "Niedowaga"
        case 18.0...24.9:
            return "Waga normalna"
        case 25...29.9:
            return "Nadwaga"
        case 30...34.9:
            return "Otyłość I stopnia"
        case 35...39.9:
            return "Otyłość II stopnia"
        default:
            return "Otyłość III stopnia"
        }
    }
}

#Preview {
    PreviewResultWrapper()
}

struct PreviewResultWrapper: View {
    @State private var weight: String = "75"
    @State private var height: String = "180"
    @State private var scoreBMI: Double = 26.0
    @State private var selectGender: String = "MEN"
    @State private var showResult: Bool = true
    
    var body: some View {
        ResultView(weight: $weight,
                   height: $height,
                   scoreBMI: $scoreBMI,
                   selectGender: $selectGender,
                   showResult: $showResult,
                   bmi: scoreBMI,
                   gender: selectGender
        )
    }
}

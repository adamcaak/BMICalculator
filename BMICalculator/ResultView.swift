//
//  ResultView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 13/05/2025.
//

import SwiftUI

struct ResultView: View {
    let bmi: Double
    let gender: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Wynik BMI")
                .font(.largeTitle)
                .bold()
            
            Text(String(format: "Twoje BMI to: %.1f", bmi))
                .padding()
                .font(.title3)
            
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
    ResultView(bmi: 26.0, gender: "MEN")
}

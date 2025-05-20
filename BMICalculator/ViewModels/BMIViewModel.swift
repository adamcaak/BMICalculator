//
//  BMIViewModel.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import SwiftUI

class BMIViewModel: ObservableObject {
    @Published var weight: String = ""
    @Published var height: String = ""
    @Published var gender: String = ""
    @Published var scoreBMI: Double = 0.0
    @Published var showResult: Bool = false
    
    func calculateBMI() -> Double {
        guard let weight = Double(weight), let height = Double(height), height > 0 else { return 0 }
        let heightInMeters = height / 100
        return weight / (heightInMeters * heightInMeters)
    }
    
    var bmiResult: BMIResult {
        BMIResult(bmi: calculateBMI(), gender: gender)
    }
    
    var resultText: (text: String, color: Color) {
        if gender == "MEN" {
            return bmiResult.interpolationForMen()
        } else if gender == "WOMEN" {
            return bmiResult.interpolationForWomen()
        } else {
            return ("Nie wybrano płci", .gray)
        }
    }
    
    func reset() {
        weight = ""
        height = ""
        gender = ""
        showResult = false
    }
}

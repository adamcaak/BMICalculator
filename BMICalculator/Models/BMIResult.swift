//
//  BMIResult.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import Foundation
import SwiftUI

struct BMIResult {
    let bmi: Double
    let gender: String
    
    func interpolationForMen() -> (text: String, color: Color) {
        switch bmi {
        case ..<18.5:
            return ("Niedowaga", .blue)
        case 18.5...24.9:
            return ("Waga normalna", .green)
        case 25...29.9:
            return ("Nadwaga", .yellow)
        case 30...34.9:
            return ("Otyłość I stopnia", .orange)
        case 35...39.9:
            return ("Otyłość II stopnia", .red)
        default:
            return ("Otyłość III stopnia", .red)
        }
    }
    
    func interpolationForWomen() -> (text: String, color: Color) {
        switch bmi {
        case ..<18.0:
            return ("Niedowaga", .blue)
        case 18.0...24.9:
            return ("Waga normalna", .green)
        case 25...29.9:
            return ("Nadwaga", .yellow)
        case 30...34.9:
            return ("Otyłość I stopnia", .orange)
        case 35...39.9:
            return ("Otyłość II stopnia", .red)
        default:
            return ("Otyłość III stopnia", .red)
        }
    }
}

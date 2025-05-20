//
//  HistoryView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import SwiftUI

struct HistoryView: View {
    var body: some View {
        VStack {
            Text("Historia pomiarów")
                .font(.title)
            Text("Tu w przyszłości pokażemy Twoje wcześniejsze wyniki BMI.")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    HistoryView()
}

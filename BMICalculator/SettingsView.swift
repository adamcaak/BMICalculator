//
//  SettingsView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack {
            Text("Ustawienia")
                .font(.title)
            Text("Tu będzie możliwość zmiany jednostek, motywu itp.")
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()
        }
    }
}

#Preview {
    SettingsView()
}

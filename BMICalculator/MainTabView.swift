//
//  MainTabView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import SwiftUI

struct MainTabView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var scoreBMI: Double = 0
    @State private var selectGender: String = ""
    @State private var showResult: Bool = false
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("BMI Calculator", systemImage: "person.circle")
                }
            
            HistoryView()
                .tabItem {
                    Label("History", systemImage: "clock.arrow.circlepath")
                }
            
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
        }
    }
}

#Preview {
    MainTabView()
}

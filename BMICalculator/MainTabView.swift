//
//  MainTabView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 20/05/2025.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            ResultView()
                .tabItem {
                    Label("Result", systemImage: "person.circle")
                }
            HistoryView() {
                .tabItem {
                    Label("History", systemImage: "clock.arrow.circlepath")
                }
            }
            
            SettingsView() {
                .tabItem {
                    Label("Settings", systemImage: "gearshape")
                }
            }
        }
    }
}

#Preview {
    MainTabView()
}

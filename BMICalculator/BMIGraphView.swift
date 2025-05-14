//
//  BMIGraphView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 14/05/2025.
//

import SwiftUI

struct BMIGraphView: View {
    var bmi: Double
    //@State private var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth: CGFloat = geometry.size.width
            let segmentCount: CGFloat = 5
            let relativeBMI = min(max(bmi, 0), 40)
            let offset = (relativeBMI / 40.0) * totalWidth
            
            ZStack(alignment: .topLeading) {
                Image(systemName: "arrowtriangle.down.fill")
                    .offset(x: offset - 8, y: -10)
                    .foregroundColor(.black)
                    .shadow(radius: 2)
                    .animation(.easeInOut(duration: 0.5), value: offset)
                VStack(spacing: 5) {
                    HStack(spacing: 0) {
                        ForEach(0..<5) { index in
                            Rectangle()
                                .frame(width: totalWidth / segmentCount, height: 40)
                                .foregroundColor(color(for: index))
                        }
                    }
                    HStack(spacing: 0) {
                        Text("Niedowaga")
                            .frame(maxWidth: .infinity)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                        Text("Norma")
                            .frame(maxWidth: .infinity)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                        Text("Nadwaga")
                            .frame(maxWidth: .infinity)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.yellow)
                        Text("Otyłość I")
                            .frame(maxWidth: .infinity)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.orange)
                        Text("Otyłość II + ")
                            .frame(maxWidth: .infinity)
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.red)
                    }
                }
                .padding(.top, 10)
            }
        }
        .frame(height: 100)
        .padding(.horizontal)
    }
    
    func color(for index: Int) -> Color {
        switch index {
        case 0: return .blue
        case 1: return .green
        case 2: return .yellow
        case 3: return .orange
        case 4: return .red
        default: return .gray
        }
    }
}

#Preview {
    BMIGraphView(bmi: 21.5)
}

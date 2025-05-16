//
//  BMIGraphView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 14/05/2025.
//

import SwiftUI

struct BMIGraphView: View {
    var bmi: Double
    
    let ranges: [ClosedRange<Double>] = [
        0...18.4,    // Niedowaga
        18.5...24.9, // Norma
        25.0...29.9, // Nadwaga
        30.0...34.9, // Otyłość I
        35.0...40.0  // Otyłość II+
    ]
    
    let labels: [String] = ["Niedowaga", "Norma", "Nadwaga", "Otyłość I", "Otyłość II +"]
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth = geometry.size.width
            let totalRange: Double = 40.0
            let clampedBMI = min(max(bmi, 0), totalRange)
            
            // Obliczamy przesunięcie strzałki względem długości każdego segmentu
            let arrowX = getOffset(for: clampedBMI, in: geometry.size.width)
            
            
            ZStack(alignment: .topLeading) {
                Image(systemName: "arrowtriangle.down.fill")
                    .offset(x: arrowX - 8, y: -10)
                    .foregroundColor(.black)
                    .shadow(radius: 2)
                    .animation(.easeInOut(duration: 0.5), value: arrowX)
                VStack(spacing: 5) {
                    HStack(spacing: 0) {
                        ForEach(0..<ranges.count, id: \.self) { index in
                            let width = width(for: ranges[index], totalWidth: totalWidth)
                            Rectangle()
                                .frame(width: width, height: 40)
                                .foregroundColor(color(for: index))
                        }
                    }
                    HStack(spacing: 0) {
                        ForEach(0..<labels.count, id: \.self) { index in
                            let width = width(for: ranges[index], totalWidth: totalWidth)
                            Text(labels[index])
                                .frame(width: width)
                                .font(.caption)
                                .fontWeight(.semibold)
                                .foregroundColor(color(for: index))
                        }
                    }
                }
                .padding(.top, 10)
            }
        }
        .frame(height: 100)
        .padding(.horizontal)
    }
    
    // Zwraca szerokość segmentu na podstawie jego zakresu
    func width(for range: ClosedRange<Double>, totalWidth: CGFloat) -> CGFloat {
        let segmentLength = range.upperBound - range.lowerBound
        return CGFloat(segmentLength / 40.0) * totalWidth
    }
    
    // Zwraca offset strzałki względem całkowitej szerokości
    func getOffset(for bmi: Double, in totalWidth: CGFloat) -> CGFloat {
        var offset: CGFloat = 0
        for range in ranges {
            let rangeWidth = width(for: range, totalWidth: totalWidth)
            if range.contains(bmi) {
                let progressInSegment = (bmi - range.lowerBound) / (range.upperBound - range.lowerBound)
                offset += CGFloat(progressInSegment) * rangeWidth
                break
            } else {
                offset += rangeWidth
            }
        }
        return offset
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

//
//  BMIGraphView.swift
//  BMICalculator
//
//  Created by Łukasz Adamczak on 14/05/2025.
//

import SwiftUI

struct BMIGraphView: View {
    var bmi: Double
    @State private var offset: CGFloat = 0
    
    var body: some View {
        GeometryReader { geometry in
            let totalWidth: CGFloat = geometry.size.width
            let relativeBMI = min(max(bmi, 0), 40)
            let targetOffset = (relativeBMI / 40.0) * totalWidth
            
            ZStack(alignment: .topLeading) {
                Image(systemName: "arrowtriangle.down.fill")
                    .offset(x: offset - 8, y: -10)
                    .foregroundColor(.black)
                    .shadow(radius: 2)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.offset = targetOffset
                        }
                    }
                    .onChange(of: bmi) { newBmi in
                        withAnimation(.easeInOut(duration: 0.5)) {
                            self.offset = (newBmi / 40.0) * totalWidth
                        }
                    }
                VStack(spacing: 5) {
                    HStack(spacing: 0) {
                        Rectangle()
                            .frame(width: totalWidth / 5, height: 40)
                            .foregroundColor(.blue)
                        Rectangle()
                            .frame(width: totalWidth / 5, height: 40)
                            .foregroundColor(.green)
                        Rectangle()
                            .frame(width: totalWidth / 5, height: 40)
                            .foregroundColor(.yellow)
                        Rectangle()
                            .frame(width: totalWidth / 5, height: 40)
                            .foregroundColor(.orange)
                        Rectangle()
                            .frame(width: totalWidth / 5, height: 40)
                            .foregroundColor(.red)
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
}

#Preview {
    BMIGraphView(bmi: 21.5)
}

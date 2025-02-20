//
//  SquircleConfigView.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//
import SwiftUI

struct SquircleConfigView: View {
    @State private var cornerRadiusFactor: CGFloat = 0.15
    @State private var smoothFactor: CGFloat = 0.20
    @State private var edgeCurvatureMultiplier: CGFloat = 0.70
    @State private var maxRadiusDivisor: CGFloat = 1.5
    @State private var radiusMultiplier: CGFloat = 0.85
    @State private var width: CGFloat = 150
    @State private var height: CGFloat = 150
    @State private var showCodeSheet: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                Squircle(cornerRadiusFactor: cornerRadiusFactor,
                         smoothFactor: smoothFactor,
                         edgeCurvatureMultiplier: edgeCurvatureMultiplier,
                         maxRadiusDivisor: maxRadiusDivisor,
                         radiusMultiplier: radiusMultiplier)
                    .frame(width: width, height: height)
                    .foregroundColor(.blue)
                
                Group {
                    HStack {
                        CustomSlider(value: $width, range: 100...250, title: "Width")
                        CustomSlider(value: $height, range: 100...250, title: "Height")
                    }
                    
                    CustomSlider(value: $cornerRadiusFactor, range: 0...1.0, title: "Corner Radius Factor")
                    CustomSlider(value: $smoothFactor, range: 0...0.5, title: "Smoothness Factor")
                    CustomSlider(value: $edgeCurvatureMultiplier, range: 0.1...1, title: "Edge Curve Factor")
                    CustomSlider(value: $maxRadiusDivisor, range: 0.1...5, title: "Max Radius Divisor (min(width, height) / maxRadiusDivisor)")
                    CustomSlider(value: $radiusMultiplier, range: 0.1...5, title: "Radius Multiplier (cornerRadiusFactor * maxRadius * radiusMultiplier)")
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Squircle")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: { showCodeSheet = true }) {
                        Image(systemName: "doc.text")
                    }
                }
            }
            .sheet(isPresented: $showCodeSheet) {
                CodeSheetView(code: extensionCode)
            }
        }
    }
    
    private var extensionCode: String {
        """
        .squircle(
            cornerRadiusFactor: \(String(format: "%.2f", cornerRadiusFactor)),
            smoothFactor: \(String(format: "%.2f", smoothFactor)),
            edgeCurvatureMultiplier: \(String(format: "%.2f", edgeCurvatureMultiplier)),
            maxRadiusDivisor: \(String(format: "%.2f", maxRadiusDivisor)),
            radiusMultiplier: \(String(format: "%.2f", radiusMultiplier))
        )
        """
    }
}

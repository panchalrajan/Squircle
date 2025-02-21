//
//  View+Extensions.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//

import SwiftUI

struct SquircleConfiguration {
    var cornerRadiusFactor: CGFloat
    var smoothFactor: CGFloat
    var edgeCurvatureMultiplier: CGFloat
    var gradient: LinearGradient?
    var fillColor: Color?
    var strokeColor: Color?
    var strokeWidth: CGFloat?
    var shadow: Bool
    var shadowRadius: CGFloat
    var shadowColor: Color
    var shadowOffset: CGSize
    
    static let `default` = SquircleConfiguration(
        cornerRadiusFactor: 0.15,
        smoothFactor: 0.15,
        edgeCurvatureMultiplier: 0.40,
        gradient: nil,
        fillColor: .blue,
        strokeColor: nil,
        strokeWidth: nil,
        shadow: false,
        shadowRadius: 5,
        shadowColor: .black,
        shadowOffset: CGSize(width: 0, height: 0)
    )
}

extension View {
    func squircle(
        cornerRadiusFactor: CGFloat = 0.0,
        smoothFactor: CGFloat = 1.0,
        edgeCurvatureMultiplier: CGFloat = 1.0
    ) -> some View {
        clipShape(
            Squircle(
                cornerRadiusFactor: cornerRadiusFactor,
                smoothFactor: smoothFactor,
                edgeCurvatureMultiplier: edgeCurvatureMultiplier
            )
        )
    }
    
    func squircle(_ config: SquircleConfiguration) -> some View {
        self.modifier(SquircleModifier(configuration: config))
    }
    
    func squircleCard(
        cornerRadius: CGFloat = 0.2,
        color: Color = .white
    ) -> some View {
        var config = SquircleConfiguration.default
        config.cornerRadiusFactor = cornerRadius
        config.fillColor = color
        config.shadow = true
        return squircle(config)
    }
    
    func squircleButton(
        cornerRadius: CGFloat = 0.2,
        gradient: LinearGradient? = nil
    ) -> some View {
        var config = SquircleConfiguration.default
        config.cornerRadiusFactor = cornerRadius
        config.gradient = gradient
        return squircle(config)
    }
    
    func squircleOutlined(
        cornerRadius: CGFloat = 0.2,
        strokeColor: Color = .blue,
        strokeWidth: CGFloat = 2
    ) -> some View {
        var config = SquircleConfiguration.default
        config.cornerRadiusFactor = cornerRadius
        config.strokeColor = strokeColor
        config.strokeWidth = strokeWidth
        return squircle(config)
    }
}

struct SquircleModifier: ViewModifier {
    let configuration: SquircleConfiguration
    
    func body(content: Content) -> some View {
        content
            .clipShape(
                Squircle(
                    cornerRadiusFactor: configuration.cornerRadiusFactor,
                    smoothFactor: configuration.smoothFactor,
                    edgeCurvatureMultiplier: configuration.edgeCurvatureMultiplier
                )
            )
            .overlay(
                Group {
                    if let gradient = configuration.gradient {
                        Squircle(
                            cornerRadiusFactor: configuration.cornerRadiusFactor,
                            smoothFactor: configuration.smoothFactor,
                            edgeCurvatureMultiplier: configuration.edgeCurvatureMultiplier
                        )
                        .fill(gradient)
                    } else if let fillColor = configuration.fillColor {
                        Squircle(
                            cornerRadiusFactor: configuration.cornerRadiusFactor,
                            smoothFactor: configuration.smoothFactor,
                            edgeCurvatureMultiplier: configuration.edgeCurvatureMultiplier
                        )
                        .fill(fillColor)
                    }
                }
            )
            .overlay(
                Group {
                    if let strokeColor = configuration.strokeColor,
                       let strokeWidth = configuration.strokeWidth {
                        Squircle(
                            cornerRadiusFactor: configuration.cornerRadiusFactor,
                            smoothFactor: configuration.smoothFactor,
                            edgeCurvatureMultiplier: configuration.edgeCurvatureMultiplier
                        )
                        .stroke(strokeColor, lineWidth: strokeWidth)
                    }
                }
            )
            .shadow(
                color: configuration.shadow ? configuration.shadowColor : .clear,
                radius: configuration.shadowRadius,
                x: configuration.shadowOffset.width,
                y: configuration.shadowOffset.height
            )
    }
}

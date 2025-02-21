//
//  SquircleViewModifier.swift
//  Squircle
//
//  Created by Rajan Panchal on 21/02/25.
//

import SwiftUI

/// A view modifier that applies Squircle styling to a view
public struct SquircleViewModifier: ViewModifier {
    let configuration: SquircleConfiguration
    
    public init(configuration: SquircleConfiguration) {
        self.configuration = configuration
    }
    
    public func body(content: Content) -> some View {
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

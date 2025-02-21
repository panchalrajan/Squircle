//
//  View+Extensions.swift
//  Squircle
//
//  Created by Rajan Panchal on 21/02/25.
//

import SwiftUI

public extension View {
    /// Clips the view to a Squircle shape
    /// - Parameters:
    ///   - cornerRadiusFactor: The corner radius factor (0.0 to 1.0)
    ///   - smoothFactor: The smooth factor (0.0 to 1.0)
    ///   - edgeCurvatureMultiplier: The edge curvature multiplier (0.0 to 1.0)
    /// - Returns: A view clipped to a Squircle shape
    func squircle(
        cornerRadiusFactor: CGFloat = 0.15,
        smoothFactor: CGFloat = 0.15,
        edgeCurvatureMultiplier: CGFloat = 0.40
    ) -> some View {
        clipShape(
            Squircle(
                cornerRadiusFactor: cornerRadiusFactor,
                smoothFactor: smoothFactor,
                edgeCurvatureMultiplier: edgeCurvatureMultiplier
            )
        )
    }
    
    /// Applies a Squircle configuration to the view
    /// - Parameter config: The Squircle configuration to apply
    /// - Returns: A view modified with the Squircle configuration
    func squircle(_ config: SquircleConfiguration) -> some View {
        modifier(SquircleViewModifier(configuration: config))
    }
    
    /// Creates a card-style view with Squircle corners
    /// - Parameters:
    ///   - cornerRadius: The corner radius factor (0.0 to 1.0)
    ///   - color: The background color of the card
    /// - Returns: A card-style view with Squircle corners
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
    
    /// Creates a button-style view with Squircle corners
    /// - Parameters:
    ///   - cornerRadius: The corner radius factor (0.0 to 1.0)
    ///   - gradient: An optional gradient to apply to the button
    /// - Returns: A button-style view with Squircle corners
    func squircleButton(
        cornerRadius: CGFloat = 0.2,
        gradient: LinearGradient? = nil
    ) -> some View {
        var config = SquircleConfiguration.default
        config.cornerRadiusFactor = cornerRadius
        config.gradient = gradient
        return squircle(config)
    }
    
    /// Creates an outlined view with Squircle corners
    /// - Parameters:
    ///   - cornerRadius: The corner radius factor (0.0 to 1.0)
    ///   - strokeColor: The color of the outline
    ///   - strokeWidth: The width of the outline
    /// - Returns: An outlined view with Squircle corners
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


//
//  SquircleConfiguration.swift
//  Squircle
//
//  Created by Rajan Panchal on 21/02/25.
//

import SwiftUI

/// Configuration options for styling a Squircle shape
public struct SquircleConfiguration: SquircleConfigurable, Sendable {
    public var cornerRadiusFactor: CGFloat
    public var smoothFactor: CGFloat
    public var edgeCurvatureMultiplier: CGFloat
    public var gradient: LinearGradient?
    public var fillColor: Color?
    public var strokeColor: Color?
    public var strokeWidth: CGFloat?
    public var shadow: Bool
    public var shadowRadius: CGFloat
    public var shadowColor: Color
    public var shadowOffset: CGSize
    
    public init(
        cornerRadiusFactor: CGFloat = 0.15,
        smoothFactor: CGFloat = 0.15,
        edgeCurvatureMultiplier: CGFloat = 0.40,
        gradient: LinearGradient? = nil,
        fillColor: Color? = .blue,
        strokeColor: Color? = nil,
        strokeWidth: CGFloat? = nil,
        shadow: Bool = false,
        shadowRadius: CGFloat = 5,
        shadowColor: Color = .black,
        shadowOffset: CGSize = .zero
    ) {
        self.cornerRadiusFactor = cornerRadiusFactor
        self.smoothFactor = smoothFactor
        self.edgeCurvatureMultiplier = edgeCurvatureMultiplier
        self.gradient = gradient
        self.fillColor = fillColor
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.shadow = shadow
        self.shadowRadius = shadowRadius
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
    }
    
    /// Default configuration for Squircle
    public static let `default` = SquircleConfiguration()
}

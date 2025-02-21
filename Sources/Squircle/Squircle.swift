//
//  Squircle.swift
//  Squircle
//
//  Created by Rajan Panchal on 21/02/25.
//

import SwiftUI

/// A protocol that defines the configuration options for a Squircle shape
public protocol SquircleConfigurable {
    var cornerRadiusFactor: CGFloat { get }
    var smoothFactor: CGFloat { get }
    var edgeCurvatureMultiplier: CGFloat { get }
}

/// A custom shape that creates a smooth, continuous curve between a square and a circle
public struct Squircle: Shape, SquircleConfigurable {
    /// The factor that determines how rounded the corners are (0.0 to 1.0)
    public var cornerRadiusFactor: CGFloat
    
    /// The factor that determines the smoothness of the curve (0.0 to 1.0)
    public var smoothFactor: CGFloat
    
    /// The multiplier that affects the curvature of the edges (0.0 to 1.0)
    public var edgeCurvatureMultiplier: CGFloat
    
    /// Creates a new Squircle shape with the specified configuration
    /// - Parameters:
    ///   - cornerRadiusFactor: The corner radius factor (0.0 to 1.0)
    ///   - smoothFactor: The smooth factor (0.0 to 1.0)
    ///   - edgeCurvatureMultiplier: The edge curvature multiplier (0.0 to 1.0)
    public init(
        cornerRadiusFactor: CGFloat = 0.15,
        smoothFactor: CGFloat = 0.15,
        edgeCurvatureMultiplier: CGFloat = 0.40
    ) {
        self.cornerRadiusFactor = cornerRadiusFactor
        self.smoothFactor = smoothFactor
        self.edgeCurvatureMultiplier = edgeCurvatureMultiplier
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let maxRadius = min(rect.width, rect.height)
        let radius = cornerRadiusFactor * maxRadius
        let smootheningFactor = radius * smoothFactor
        let edgeCurvature = radius * edgeCurvatureMultiplier
        
        let cornerControlPoints = [
            CGPoint(x: rect.maxX - smootheningFactor, y: rect.minY + smootheningFactor),
            CGPoint(x: rect.maxX - smootheningFactor, y: rect.maxY - smootheningFactor),
            CGPoint(x: rect.minX + smootheningFactor, y: rect.maxY - smootheningFactor),
            CGPoint(x: rect.minX + smootheningFactor, y: rect.minY + smootheningFactor)
        ]
        
        let edgeControlPoints = [
            CGPoint(x: rect.midX, y: rect.minY - edgeCurvature),
            CGPoint(x: rect.maxX + edgeCurvature, y: rect.midY),
            CGPoint(x: rect.midX, y: rect.maxY + edgeCurvature),
            CGPoint(x: rect.minX - edgeCurvature, y: rect.midY)
        ]
        
        let connectionPoints = [
            CGPoint(x: rect.minX + radius, y: rect.minY),
            CGPoint(x: rect.maxX - radius, y: rect.minY),
            CGPoint(x: rect.maxX, y: rect.minY + radius),
            CGPoint(x: rect.maxX, y: rect.maxY - radius),
            CGPoint(x: rect.maxX - radius, y: rect.maxY),
            CGPoint(x: rect.minX + radius, y: rect.maxY),
            CGPoint(x: rect.minX, y: rect.maxY - radius),
            CGPoint(x: rect.minX, y: rect.minY + radius)
        ]
        
        path.move(to: connectionPoints[0])
        path.addQuadCurve(to: connectionPoints[1], control: edgeControlPoints[0])
        path.addCurve(to: connectionPoints[2], control1: cornerControlPoints[0], control2: cornerControlPoints[0])
        path.addQuadCurve(to: connectionPoints[3], control: edgeControlPoints[1])
        path.addCurve(to: connectionPoints[4], control1: cornerControlPoints[1], control2: cornerControlPoints[1])
        path.addQuadCurve(to: connectionPoints[5], control: edgeControlPoints[2])
        path.addCurve(to: connectionPoints[6], control1: cornerControlPoints[2], control2: cornerControlPoints[2])
        path.addQuadCurve(to: connectionPoints[7], control: edgeControlPoints[3])
        path.addCurve(to: connectionPoints[0], control1: cornerControlPoints[3], control2: cornerControlPoints[3])
        
        return path
    }
}

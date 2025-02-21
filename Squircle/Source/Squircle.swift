//
//  Squircle.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//

import SwiftUI

struct Squircle: Shape {
    var cornerRadiusFactor: CGFloat
    var smoothFactor: CGFloat = 1
    var edgeCurvatureMultiplier: CGFloat = 1
    
    func path(in rect: CGRect) -> Path {
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

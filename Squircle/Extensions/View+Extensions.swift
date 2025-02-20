//
//  View+Extensions.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//

import SwiftUI

extension View {
    func squircle(
        cornerRadiusFactor: CGFloat = 0.0,
        smoothFactor: CGFloat = 1.0,
        edgeCurvatureMultiplier: CGFloat = 1.0,
        maxRadiusDivisor: CGFloat = 1.0,
        radiusMultiplier: CGFloat = 1.0
    ) -> some View {
        clipShape(
            Squircle(
                cornerRadiusFactor: cornerRadiusFactor,
                smoothFactor: smoothFactor,
                edgeCurvatureMultiplier: edgeCurvatureMultiplier,
                maxRadiusDivisor: maxRadiusDivisor,
                radiusMultiplier: radiusMultiplier
            )
        )
    }
}


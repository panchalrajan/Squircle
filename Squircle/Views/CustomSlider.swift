//
//  CustomSlider.swift
//  Squircle
//
//  Created by Rajan Panchal on 20/02/25.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: CGFloat
    let range: ClosedRange<CGFloat>
    let title: String
    
    var body: some View {
        VStack(spacing: 2) {
            HStack {
                Text(title)
                    .font(.caption2)
                Spacer()
                Text(String(format: "%.2f", value))
                    .font(.caption2)
                    .monospacedDigit()
            }
            Slider(value: $value, in: range)
        }
    }
}

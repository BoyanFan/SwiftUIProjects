//
//  ProgressCircle.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import SwiftUI

/// A view that shows the progress in a circular shape. The style has been configured by default. Pass in new style to configure.
///
/// - Parameters
///     - progress: A binding value for the progress to display.
///     - accentColor: The accent color for this view.
///     - lineWidth: The width of the line of the circle.
///     - opacity: The opacity of the background, comparing with the forground style.
///
struct ProgressCircle: View {
    // The progress value the progress circle will present
    @Binding var progress: Float
    
    // Style configuration
    var accentColor: Color = .accentColor
    var lineWidth: CGFloat = 25
    var opacity: CGFloat = 0.15
        
    var body: some View {
        ZStack {
            // Background
            Circle()
                .stroke(lineWidth: lineWidth)
                .opacity(opacity)
                .foregroundStyle(accentColor)
            
            // Forground
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round, lineJoin: .round))
                .foregroundStyle(accentColor)
                .rotationEffect(Angle(degrees: 270))
                .animation(.spring(.smooth), value: progress)
            
        }
    }
}

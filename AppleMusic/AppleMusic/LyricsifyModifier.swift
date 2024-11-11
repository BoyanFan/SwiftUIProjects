//
//  LyricsifyModifier.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/2.
//

import SwiftUI

struct LyricsifyModifier: Animatable, ViewModifier {
    private var isOnStage: Bool
    private var opacity: CGFloat
    private var scale: CGFloat
    private var blur: CGFloat
    private var shadow: CGFloat
    
    var animatableData: CGFloat {
        get { return isOnStage ? 1 : 0 }
        set {
            opacity = isOnStage ? newValue * CGConstants.onStageOpacity : max(newValue * CGConstants.onStageOpacity, CGConstants.offStageOpacity)
            scale = newValue * (CGConstants.onStageScale - 1) + 1
            shadow = newValue * CGConstants.onStageShadow
        }
    }
    
    init(isOnStage: Bool, blurAmount: CGFloat) {
        self.isOnStage = isOnStage
        self.opacity = isOnStage ? CGConstants.onStageOpacity : CGConstants.offStageOpacity
        self.scale = isOnStage ? CGConstants.onStageScale : 1
        self.blur = blurAmount
        self.shadow = 0
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.trailing, CGConstants.lyricsPadding)
            .foregroundColor(.white)
            .font(.title.bold())
            .shadow(radius: shadow)
            .scaleEffect(CGConstants.lyricsScale, anchor: .leading)
            .opacity(opacity)
            .scaleEffect(scale, anchor: .leading)
            .blur(radius: blur)
    }
    
    private struct CGConstants {
        static let onStageOpacity: CGFloat = 1
        static let offStageOpacity: CGFloat = 0.6
        static let onStageScale: CGFloat = 1.13
        static let onStageShadow: CGFloat = 1
        static let lyricsScale: CGFloat = 1.1
        static let lyricsPadding: CGFloat = 70
    }
}

extension View {
    func lyricsify(isOnStage: Bool, blurAmount: CGFloat) -> some View {
        return self.modifier(LyricsifyModifier(isOnStage: isOnStage, blurAmount: blurAmount))
    }
}

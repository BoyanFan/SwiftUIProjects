//
//  LyricsView.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/1.
//

import SwiftUI

struct LyricsView: View {
    @ObservedObject var model: LyricsViewModel
    
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            lyricsView
                .mask(Rectangle().frame(height: CGConstants.maskHeight).blur(radius: CGConstants.maskBlur).offset(y: CGConstants.maskOffset))
            
            VStack {
                headView
                Spacer()
                progressBar.padding()
            }
        }
        .background(.black.opacity(CGConstants.exposure))
        .background(BackgroundView())
        .statusBar(hidden: true)
    }
    
    private var headView: some View {
        HStack(alignment: .center, spacing: CGConstants.spacingInHStack) {
            Image(model.coverName)
                .resizable()
                .frame(width: CGConstants.coverSize, height: CGConstants.coverSize)
                .mask(RoundedRectangle(cornerRadius: CGConstants.coverCornerRadius, style: .continuous))
                .shadow(radius: CGConstants.coverShadowRadius)
            
            VStack(alignment: .leading, spacing: CGConstants.spacingInVStack) {
                Text(model.title)
                    .font(.headline)
                    .scaleEffect(CGConstants.titleScale, anchor: .bottomLeading)
                    .foregroundColor(.white)
                Text(model.artist)
                    .font(.system(size: CGConstants.artistSize))
                    .foregroundColor(.white)
                    .opacity(CGConstants.artistOpacity)
            }
            .shadow(radius: CGConstants.textShadow)
            
            Spacer()

            Image(systemName: CGConstants.repeatImageName)
                .opacity(CGConstants.repeatTextOpacity)
                .foregroundColor(.white)
                .font(.system(size: CGConstants.repeatImageSize))
                .padding(CGConstants.paddingInRepeatBackground)
                .background(.ultraThinMaterial, in: Circle())
                .shadow(radius: CGConstants.repeatShadowRadius)
        }
        .padding(.horizontal, CGConstants.horizontalPaddingInHStack)
        .padding(.vertical, CGConstants.verticalPaddingInHStack)
    }
    
    private var lyricsView: some View {
        ScrollView {ScrollViewReader { proxy in
                VStack(alignment: .leading, spacing: CGConstants.spacingInLyrics) {
                    ForEach(model.lyrics) { lyrics in
                        Text(lyrics.content)
                            .lyricsify(isOnStage: lyrics.isOnStage, blurAmount: distance(from: model.nowOnStage, to: lyrics.id))
                            .offset(y: CGConstants.lyricsVerticalOffset)
                    }
                    
                    Color.clear.frame(height: CGConstants.placeHolderHeight)
                }
                .padding(.horizontal, CGConstants.paddingInScrollView)
                .onTapGesture {
                    withAnimation(.spring()) {
                        model.nextLyrics()
                        proxy.scrollTo(model.nowOnStage, anchor: .top)
                    }
                    
                    if !model.isPlaying { model.isPlaying.toggle() }
                }
            }
        }
    }
    
    private var progressBar: some View {
        VStack {
            ZStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: CGConstants.progressBarHeight, style: .circular)
                    .frame(width: CGConstants.progressBarWidth, height: CGConstants.progressBarHeight)
                    .foregroundColor(.white)
                    .opacity(CGConstants.progressBarBackgroundOpacity)
                RoundedRectangle(cornerRadius: CGConstants.progressBarHeight, style: .circular)
                    .frame(width: CGConstants.progressBarWidth * CGFloat(model.progress), height: CGConstants.progressBarHeight)
                    .foregroundColor(.white)
                    .opacity(CGConstants.progressBarPlayerOpacity)
            }
            
            HStack(alignment: .center) {
                Text(model.songHasPlayedTime)
                Spacer()
                
                ZStack {
                    HStack(spacing: CGConstants.spacingINDemoContent) {
                        Image(systemName: model.stateImageName).font(.system(size: CGConstants.demoImageSize))
                        Text(model.stateText).font(.system(size: CGConstants.demoTextSize))
                    }
                    
                    RoundedRectangle(cornerRadius: CGConstants.demoBorderHeight, style: .circular)
                        .strokeBorder(lineWidth: CGConstants.demoBorderLineWidth)
                        .frame(width: CGConstants.demoBorderWidth, height: CGConstants.demoBorderHeight)
                }
                .opacity(CGConstants.demoOpacity)
                
                Spacer()
                Text(model.songRemainedTime)
            }
            .monospacedDigit()
            .font(.system(size: CGConstants.displayedTimeSize))
            .foregroundColor(.white)
            .padding(.horizontal, CGConstants.horizontalPaddingInDisplayedTime)
            .padding(.vertical, CGConstants.verticalPaddingInDisplayedTime)
            .onReceive(timer) { _ in
                if model.isPlaying { model.playing() }
            }
        }
    }
    
    private struct CGConstants {
        // HeadView
        static let coverSize: CGFloat = 70
        static let coverCornerRadius: CGFloat = 7
        static let coverShadowRadius: CGFloat = 7
        static let spacingInVStack: CGFloat = 7
        static let spacingInHStack: CGFloat = 15
        static let spacingInLyrics: CGFloat = 38
        static let horizontalPaddingInHStack: CGFloat = 20
        static let verticalPaddingInHStack: CGFloat = 15
        static let titleScale: CGFloat = 1.1
        static let repeatImageSize: CGFloat = 16
        static let repeatImageName: String = "repeat.1"
        static let paddingInRepeatBackground: CGFloat = 8
        static let repeatShadowRadius: CGFloat = 1
        static let repeatTextOpacity: CGFloat = 0.9
        
        // LyricsView
        static let exposure: CGFloat = 0.5
        static let paddingInScrollView: CGFloat = 18
        static let artistOpacity: CGFloat = 0.8
        static let artistSize: CGFloat = 15
        static let textShadow: CGFloat = 5
        static let lyricsVerticalOffset: CGFloat = 155
        static let placeHolderHeight: CGFloat = 190
        static let maskHeight: CGFloat = 580
        static let maskBlur: CGFloat = 10
        static let maskOffset: CGFloat = 10
        
        // ProgressBarView
        static let progressBarHeight: CGFloat = 8
        static let progressBarWidth: CGFloat = 340
        static let progressBarBackgroundOpacity: CGFloat = 0.4
        static let progressBarPlayerOpacity: CGFloat = 0.8
        static let verticalPaddingInDisplayedTime: CGFloat = 5
        static let horizontalPaddingInDisplayedTime: CGFloat = 10
        static let displayedTimeSize: CGFloat = 15
        
        // Demo
        static let demoImageSize: CGFloat = 12
        static let demoTextSize: CGFloat = 14
        static let spacingINDemoContent: CGFloat = 3
        static let demoBorderHeight: CGFloat = 25
        static let demoBorderWidth: CGFloat = 80
        static let demoBorderLineWidth: CGFloat = 1.5
        static let demoOpacity: CGFloat = 0.7
    }
    
    private func distance(from a: Int, to b: Int) -> CGFloat {
        return CGFloat(abs(a - b))
    }
}

struct ContentView_Previews: PreviewProvider {
    private static let model = LyricsViewModel()
    
    static var previews: some View {
        LyricsView(model: model)
    }
}

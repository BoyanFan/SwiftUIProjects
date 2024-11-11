//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by fanboyan on 2022/8/1.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    private let model = LyricsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LyricsView(model: model)
        }
    }
}

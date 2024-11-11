//
//  EngLinksAppApp.swift
//  EngLinksApp
//
//  Created by fanboyan on 2023/4/11.
//

import SwiftUI

@main
struct EngLinksAppApp: App {
    var engLinks = EngLinksApp()
    
    var body: some Scene {
        WindowGroup {
            ContentView(engLinks: engLinks)
        }
    }
}

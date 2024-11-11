//
//  SyncSyncApp.swift
//  SyncSync
//
//  Created by fanboyan on 2023/1/14.
//

import SwiftUI

@main
struct SyncSyncApp: App {
    private var data = SyncSyncViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(data: data)
        }
    }
}

//
//  ContentView.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/10.
//

import SwiftUI

struct ContentView: View {    
    // App's settings across the whole app, as an environment object
    @StateObject var settings = Settings()
    
    @State var selectedNavigationBarItem: NavigationBarItem = .timeBalance
    @State var isQuickWidgetExpanded: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // Content
            switch selectedNavigationBarItem {
                case .timeBalance: TimeBalanceView()
                case .browse: BrowseView()
                case .trends: TrendsView()
                case .settings: SettingsView()
            }
            
            NavigationBar(selectedNavigationBarItem: $selectedNavigationBarItem)
            
            // Content's Widget
            if selectedNavigationBarItem == .timeBalance {
                TimeBalanceQuickWidget(isQuickWidgetExpanded: $isQuickWidgetExpanded)
                    .offset(y: isQuickWidgetExpanded ? 50 : -45)
            }
        }
        .environmentObject(settings)
        .ignoresSafeArea(.keyboard)
    }
}


#Preview {
    ContentView().environmentObject(Settings())
}

//
//  NavigationBarItem.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import Foundation

let navigationBarItemCollection: [NavigationBarItemDisplay] = [
    NavigationBarItemDisplay(id: "navigation-bar-item-time-balance", text: "Balance", icon: "clock", selectedIcon: "clock.fill", item: .timeBalance),
    NavigationBarItemDisplay(id: "navigation-bar-item-browse", text: "Browse", icon: "square.grid.2x2", selectedIcon: "square.grid.2x2.fill", item: .browse),
    NavigationBarItemDisplay(id: "navigation-bar-item-trends", text: "Trends", icon: "chart.bar", selectedIcon: "chart.bar.fill", item: .trends),
    NavigationBarItemDisplay(id: "navigation-bar-item-settings", text: "Settings", icon: "gear", selectedIcon: "gear", item: .settings)
]

struct NavigationBarItemDisplay: Identifiable {
    var id: String
    var text: String
    var icon: String
    var selectedIcon: String
    var item: NavigationBarItem
}

enum NavigationBarItem: String {
    case timeBalance, browse, trends, settings
}

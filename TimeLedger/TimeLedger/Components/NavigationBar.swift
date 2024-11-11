//
//  NavigationBar.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import SwiftUI

struct NavigationBar: View {
    @Environment (\.colorScheme) var colorScheme
    @Binding var selectedNavigationBarItem: NavigationBarItem
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(navigationBarItemCollection) { item in
                // Eact of the Navigation Bar Item
                VStack(spacing: 2) {
                    Image(systemName: item.item == selectedNavigationBarItem ? item.selectedIcon : item.icon)
                        .font(.title2)
                        .font(.body.bold())
                        .frame(width: 44, height: 29)
                    Text(item.text)
                        .font(.caption2)
                        .lineLimit(1)
                }
                .foregroundStyle(item.item == selectedNavigationBarItem ? .accent : .primary)
                .onTapGesture { selectedNavigationBarItem = item.item}
                
                // Equally spacing all items
                if item.id != "navigation-bar-item-settings" { Spacer() }
            }
        }
        .padding(.horizontal, 30)
        .padding(.top, 75)
        .background(gradientBlur)
    }
    
    // A view that provides a gradient in blur effect
    private var gradientBlur: some View {
        Rectangle()
            .fill(.ultraThinMaterial)
            .overlay(
                Rectangle()
                    .fill(.black)
                    .opacity((colorScheme == .dark && selectedNavigationBarItem != .timeBalance) ? 1 : 0)
            )
            .frame(height: 200)
            .mask {
                VStack(spacing: 0) {
                    LinearGradient(colors: [.black.opacity(0), .black], startPoint: .top, endPoint: .bottom).frame(height: 100)
                    Rectangle()
                }
            }
    }
}

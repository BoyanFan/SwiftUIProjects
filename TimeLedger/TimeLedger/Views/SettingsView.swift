//
//  SettingsView.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import SwiftUI
import Symbols

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    
    @State var isOnTapped: Bool = false
        
    var body: some View {
        Form {
            header
            ledgerTitle
            skyConfiguration
        }
    }
    
    // The section for the header which contains the ledget's title and version
    private var header: some View {
        ZStack {
            HStack(spacing: 15) {
                // App Icon
                ZStack {
                    Image(systemName: "square.fill")
                        .font(.system(size: 70))
                        .foregroundStyle(.ultraThickMaterial)
                        .shadow(color: .black.opacity(0.2), radius: 5)
                        .symbolEffect(.bounce, value: isOnTapped)
                        
                    Image(systemName: "timer.circle.fill")
                        .font(.system(size: 45))
                        .foregroundStyle(LinearGradient(colors: [.accent, .accent.opacity(0.7)], startPoint: .bottom, endPoint: .top))
                        .symbolEffect(.bounce, value: isOnTapped)
                }
                
                // Information
                VStack(alignment: .leading, spacing: 5) {
                    // Ledger Title
                    Text(settings.ledgerTitle)
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    // App Version
                    Text("Version: " + settings.version.replacing(["_"], with: [" "]).capitalized)
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
        }
        .frame(height: 100)
        .onTapGesture { isOnTapped.toggle() }
    }
    
    // The section for editing ledget's title
    private var ledgerTitle: some View {
        Section(header: Text("Ledger Title")) {
            TextField("Ledgr Name", text: settings.$ledgerTitle)
        }
    }
    
    // The section for configuring the sky in the TimeBalanceView
    private var skyConfiguration: some View {
        Section(header: Text("Sky Configuration")) {
            Toggle("Show Sky", isOn: settings.$isSkyShown)
            Toggle("Dynamic Sky", isOn: settings.$isSkyDynamic).disabled(!settings.isSkyShown)
            
            Picker("Sky Color Sets", selection: settings.$customizedSkyColor) {
                ForEach(Date.DayPeriod.allCases) { item in
                    Text(item.rawValue.capitalized)
                }
            }
            .disabled(settings.isSkyDynamic || !settings.isSkyShown)
        }
    }
}

#Preview {
    SettingsView().environmentObject(Settings())
}

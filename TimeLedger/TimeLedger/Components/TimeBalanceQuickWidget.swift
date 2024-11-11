//
//  TimeBalanceQuickWidget.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/13.
//

import SwiftUI

struct TimeBalanceQuickWidget: View {
    @EnvironmentObject var settings: Settings
    @Environment(\.colorScheme) var colorScheme
    
    @Binding var isQuickWidgetExpanded: Bool
    
    // Create a new event
    @State private var event = Event()
    @State private var duration: Int = 1
        
    var body: some View {
        VStack {
            header
            if isQuickWidgetExpanded { expandedContent }
        }
        .background(.regularMaterial)
        .mask(RoundedRectangle(cornerRadius: 15))
        .padding(isQuickWidgetExpanded ? 0 : 15)
        .shadow(color: .primary.opacity(colorScheme == .light ? 0.2 : 0), radius: 10)
        .animation(.smooth, value: isQuickWidgetExpanded)
    }
    
    // The header for the wedget, which is always displayed in both expanded and folded states
    private var header: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack {
                Text("Balance in")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button(action: { isQuickWidgetExpanded.toggle() }) {
                    Image(systemName: "plus")
                }
                .buttonStyle(.bordered)
                .foregroundStyle( isQuickWidgetExpanded ? Color.secondary : .accent )
                .rotationEffect( isQuickWidgetExpanded ? Angle(degrees: 45) : Angle(degrees: 0))
                .animation(.smooth, value: isQuickWidgetExpanded)
                .background(.componentWhite)
                .mask(Circle())
                .shadow(color: .black.opacity(0.1), radius: 5)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
            
            // A picker to choose one of the avalaible formats for displaying the tiem balance
            Picker("Banlance Display Format", selection: settings.$balanceDisplayFormat) {
                ForEach(BalanceDisplayFormat.allCases) { format in
                    Text(format.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
            .padding(.horizontal, 10)
            .padding(.bottom, 10)
        }
    }
    
    // The content which should be displayed when the wdeget is expanded
    private var expandedContent: some View {
        VStack {
            Form {
                Section(header: Text("Title and Icon")) {
                    TextField("Title", text: $event.title)
                    ColorPicker("Color", selection: $event.color)
                }
                
                Section(header: Text("Date and Duration")) {
                    DatePicker("Date", selection: $event.creationDate)
                    Stepper("Duration: \(duration) \(updateContent(value: duration))", value: $duration) { _ in
                        if duration < 1 { duration = 1 }
                    }
                }
                
                Section(header: Text("Description")) {
                    TextEditor(text: $event.description)
                }
            }
            .navigationTitle("Add a new event")
            .scrollContentBackground(.hidden)
            .frame(height: 550)
        }
    }
    
    /// Convert from an integer and a BalanceDisplayFormat to a DateComponent.
    ///
    /// - Parameters:
    ///   - value: The value of the DateComponent.
    ///   - format: The unit of the DateComponent.
    /// - Returns: A DateComponent for the given value and format.
    ///
    private func convertToDateComponent(value: Int) -> DateComponents {
        switch settings.balanceDisplayFormat {
            case .today: return DateComponents(hour: value)
            case .year: return DateComponents(month: value)
            case .month: return DateComponents(day: value)
            case .week: return DateComponents(day: value)
        }
    }
    
    /// Update the content displaying in the Stepper by getting a correct unit.
    ///
    /// - Parameter value: The value for getting a correct unit.
    /// - Returns: A correct unit associated with the given value.
    ///
    private func updateContent(value: Int) -> String {
        switch settings.balanceDisplayFormat {
            case .today: return value == 1 ? "hour" : "hours"
            case .year: return value == 1 ? "month" : "months"
            case .month: return value == 1 ? "day" : "days"
            case .week: return value == 1 ? "day" : "days"
        }
    }
}

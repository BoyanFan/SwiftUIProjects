//
//  TimeBalanceView.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import SwiftUI
import SwiftData
import Foundation
import Charts
import Combine

struct TimeBalanceView: View {
    @Environment(\.colorScheme) var colorScheme
    @EnvironmentObject var settings: Settings
        
    @State var progress: Float = 1.0
    @State var content: (String?, String?, String?) = (nil, nil, nil)
    
    var body: some View {
        ZStack {
            if settings.isSkyShown { Rectangle().fill(backgroundColor).ignoresSafeArea() }
            
            ScrollView {
                VStack(alignment: .leading) {
                    progressCircle.padding(50)
                    
                    // ...
                }
            }
        }
    }
    
    // The progress circle that shows the today's balance
    private var progressCircle: some View {
        ZStack {
            ProgressCircle(progress: $progress)
                .frame(width: 280)
                .onReceive(Just(settings.balanceDisplayFormat), perform: { _ in
                    content = updateContent(in: settings.balanceDisplayFormat)
            })
            
            // The text content displayed at the center of the circle
            VStack(spacing: 0) {
                Text(content.0?.uppercased() ?? "--")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                
                HStack(alignment: .bottom) {
                    Text(content.1 ?? "--")
                        .font(.system(size: 50))
                        .fontWeight(.bold)
                    Text(content.2 ?? "NA")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .baselineOffset(4)
                }.fontDesign(.rounded)
                
                Text("You still have".uppercased())
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
    }
    
    // Switch background colors according to different time periods of the day
    private var backgroundColor: LinearGradient {
        if settings.isSkyShown, settings.isSkyDynamic {
            return getSkyColor(from: Date.dayPeriod)
        }
        
        if settings.isSkyShown, !settings.isSkyDynamic {
            return getSkyColor(from: settings.customizedSkyColor)
        }
        
        let clean: Color = colorScheme == .light ? .white : .black
        return LinearGradient(colors: [clean, clean], startPoint: .bottom, endPoint: .top)
    }
    
    /// Get sky color from a given day period.
    ///
    /// - Parameter dayPeriod: The day period that is requiring for a sky color.
    /// - Returns: A linear gradient color for the current period of the sky.
    /// 
    private func getSkyColor(from dayPeriod: Date.DayPeriod) -> LinearGradient {
        let clean: Color = colorScheme == .light ? .white : .black
        
        switch dayPeriod {
            case .dawn: return LinearGradient(colors: [.skyDawnStart, .skyDawnEnd], startPoint: .bottom, endPoint: .top)
            case .day: return LinearGradient(colors: [.skyDayStart, .skyDayEnd], startPoint: .bottom, endPoint: .top)
            case .sunset: return LinearGradient(colors: [.skySunsetStart, .skySunsetEnd], startPoint: .bottom, endPoint: .top)
            case .night: return LinearGradient(colors: [.skyNightStart, .skyNightEnd], startPoint: .bottom, endPoint: .top)
            default: return LinearGradient(colors: [clean, clean], startPoint: .bottom, endPoint: .top)
        }
    }
    
    /// Update the text content displayed along with the progress, as well as the progress value after the user select a new display format for the balance.
    ///
    /// - Parameter format: The format you wish to get, usually in hours or minutes.
    /// - Returns: The text content for view to display in a tuple with an order of (content, value, unit).
    ///
    private func updateContent(in format: BalanceDisplayFormat) -> (String?, String?, String?) {
        var content, value, unit: String?
        
        if settings.balanceDisplayFormat == .today, let hour = Date.getTimeBalance(in: .hour) {
            content = "Today"
            value = String(hour)
            unit = hour == 1 ? "Hour" : "Hours"
            
            self.progress = Float(hour) / 24.0
        }
        
        if settings.balanceDisplayFormat == .week, let week = Date.getTimeBalance(in: .weekday) {
            content = "This week"
            value = String(week)
            unit = week == 1 ? "Day" : "Days"
            
            self.progress = Float(week) / 7.0
        }
        
        if settings.balanceDisplayFormat == .month, let month = Date.getTimeBalance(in: .day) {
            content = "This month"
            value = String(month)
            unit = month == 1 ? "Day" : "Days"
            
            self.progress = Float(month) / Float(Date.numberOfDaysInCurrentMonth ?? 30)
        }
        
        if settings.balanceDisplayFormat == .year, let month = Date.getTimeBalance(in: .month) {
            content = "This year"
            value = String(month)
            unit = month == 1 ? "Month" : "Months"
            
            self.progress = Float(month) / 12.0
        }
        
        return (content, value, unit)
    }
}

//
//  Date.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import Foundation

extension Date {
    // Different periods of a day. Returning the special case .all means there is an unwrapping failure.
    static var dayPeriod: Date.DayPeriod {
        // Get the components of the current time
        let components = Calendar.current.dateComponents([.hour], from: Date.now)
        
        if let hour = components.hour {
            if 5 <= hour && hour <= 7 { return .dawn }
            if 8 <= hour && hour <= 16 { return .day }
            if 17 <= hour && hour <= 19 { return .sunset }
            if 20 <= hour || hour <= 4 { return .night }
        }
        
        // Return a special case .all if it fails to get the time components
        return .none
    }
    
    // The number of days for the current month
    static var numberOfDaysInCurrentMonth: Int? {
        let components = Calendar.current.dateComponents([.year, .month], from: Date.now)
        
        let calendar = Calendar.current
        let date = calendar.date(from: DateComponents(year: components.year, month: components.month))!
        let range = calendar.range(of: .day, in: .month, for: date)!
        
        return range.count
    }
    
    /// Get how much time is left from now on, in a given format.
    ///
    /// - Parameter format: The format you wish to get, usually in hours or minutes.
    /// - Returns:          The time is left from now on.
    ///
    /// - Note: This function only implements the returns in the following formats, where all of them are rounded up:
    ///             - Hours and minutes left for today
    ///             - Days left for this week, where Sunday is the first day for a week
    ///             - Days left for this month
    ///             - Months left for this year
    ///
    ///         Function will return a nil if an invalid formate is passed or the calendar is unable to get the time components.
    ///
    static func getTimeBalance(in format: Calendar.Component) -> Int? {
        // Get the components of the current time
        let components = Calendar.current.dateComponents([.month, .day, .weekday, .hour, .minute], from: Date.now)
            
        if let hour = components.hour, let minute = components.minute {
            // Get the left time in hours for today
            if format == .hour { return 24 - hour }
            
            // Get the left time in minutes for today
            if format == .minute { return (24 - hour) * 60 - minute }
        }
        
        // Get the left time in days for this month
        if format == .day {
            if let day = components.day, let total = Date.numberOfDaysInCurrentMonth  { return total - day }
        }
        
        // Get the left time in days for this week, where Sunday is the first day for a week
        if format == .weekday {
            if let weekday = components.weekday { return 7 - weekday }
        }
        
        // Get the left time in months for this year
        if format == .month {
            if let month = components.month { return 12 - month }
        }
        
        return nil
    }
    
    // Different periods of a day. A special case .all should be returned if there is an unwrapping failure
    enum DayPeriod: String, CaseIterable, Identifiable {
        case dawn, day, sunset, night, none
        var id: Self { self }
    }
}

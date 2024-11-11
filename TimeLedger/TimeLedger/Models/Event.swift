//
//  Event.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/23.
//

import Foundation
import SwiftUI

struct Event: Identifiable {
    var title: String
    var category: EventCategory
    var icon: String
    var color: Color
    var description: String
    var duration: DateComponents
    var creationDate: Date
    var id: UUID
    
    init(title: String = "New Event",
         category: EventCategory = EventCategory(),
         icon: String = "calendar",
         color: Color = .secondary,
         description: String = "Add notes for it...",
         duration: DateComponents = DateComponents(hour: 1),
         creationDate: Date = Date.now) {
        self.title = title
        self.category = category
        self.icon = icon
        self.color = color
        self.description = description
        self.duration = duration
        self.creationDate = creationDate
        
        self.id = UUID()
    }
}

struct EventCategory: Identifiable {
    var title: String
    var icon: String
    var color: Color
    var description: String
    var id: UUID
    
    init(title: String = "New Category",
         icon: String = "text.book.closed",
         color: Color = .primary,
         description: String = "This is a new category for...") {
        self.title = title
        self.icon = icon
        self.color = color
        self.description = description
        
        self.id = UUID()
    }
}

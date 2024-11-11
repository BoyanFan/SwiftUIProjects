//
//  TimeBalance.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/11.
//

import Foundation

// All avalaible formats for displaying the tiem balance
enum BalanceDisplayFormat: String, CaseIterable, Identifiable {
    case year, month, week, today
    var id: Self { self }
}

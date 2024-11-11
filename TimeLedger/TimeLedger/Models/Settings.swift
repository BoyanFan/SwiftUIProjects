//
//  Settings.swift
//  TimeLedger
//
//  Created by fanboyan on 2023/6/12.
//

import Foundation
import SwiftUI

final class Settings: ObservableObject {
    
    // - MARK: APP -
    
    /// App : Version
    /// The version identifier of this app. Note that it is for display instead of iteration.
    ///
    @AppStorage("__APP__VERSION_IDENTIFIER") var version: String = "time_0.10_developer_alpha"
    
    /// App : Cache
    /// The time balance display format in the TimeBalanceView for the .QuickWedget.
    /// 
    @AppStorage("__APP__CACHE_BALANCE_DISPLAY_FORMAT") var balanceDisplayFormat: BalanceDisplayFormat = .today
    
    /// APP : Cache
    /// If it is the first time user launch the app.
    ///
    @AppStorage("__APP__CACHE_IS_FIRST_TIME_LAUNCH") var isAppFirstTimeLaunch: Bool = true
    
    
    // - MARK: Setting -
    
    /// Settings : String
    /// Users can customize the title of their ledger.
    ///
    @AppStorage("__UCV__setting-ledger-title") var ledgerTitle: String = "Your Ledger"
    
    
    // - MARK: Time Balance -
    
    /// TimeBalanceView.Sky : Color
    /// User customized sky color. Note that it can only be enabled when the sky is not dynamic.
    ///
    @AppStorage("__UCV__time-balance-sky-color") var customizedSkyColor: Date.DayPeriod = .none
    
    /// TimeBalanceView.ProgressCircle : Color
    /// User customized forground color for the progress circle. Note that by default, the color is dynamic.
    ///
    @AppStorage("__UCV__time-balance-progress-circle-color") var customizedProgressCircleColor: String = "E53D44"
    
    /// TimeBalanceView.Sky : Toggle
    /// Turn on or off the background of Sky.
    ///
    @AppStorage("time-balance-is-sky-show") var isSkyShown: Bool = true
    
    /// TimeBalanceView.Sky : Toggle
    /// If the color theme of the sky changes according to the different period of a day.
    ///
    @AppStorage("time-balance-is-sky-dynamic") var isSkyDynamic: Bool = true
}

//
//  String.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//
//  swiftlint:disable string_literals

import SwiftUI

extension String {

    /// The selector for the settings window.
    static var settingsWindowSelector: Self { "showSettingsWindow:" }
    /// The identifier for the settings window.
    public static var settingsWindowIdentifier: Self { "com_apple_SwiftUI_Settings_window" }
    /// The identifier for the selected subtabs in the user defaults.
    static var selectedSubtabs: Self { "selected_subtabs" }

}

//
//  SettingsAction.swift
//  SettingsKit
//
//  Created by david-swift on 21.01.23.
//

import SwiftUI

/// Actions for interacting with SettingsKit.
public enum SettingsAction {

    /// The shared instance of the settings model.
    static var settingsModel: SettingsModel { .shared }

    // swiftlint:disable string_literals
    /// Show the settings window.
    ///
    /// This function does no longer work in macOS 14 or higher.
    /// Please use the `SettingsLink` view for adding a button for opening the settings.
    ///
    /// - Parameters:
    ///   - tab: The identifier of the new tab selection.
    ///   - subtab: The identifier of the new subtab selection.
    @available(
        macOS,
        deprecated: 14,
        message: """
        This function does no longer work in macOS 14 or higher.
        Please use the "SettingsLink" SwiftUI view for adding a button for opening the settings.
        """
    )
    public static func showSettings(tab: String? = nil, subtab: String? = nil) {
        if let tab {
            settingsModel.selectedTab = tab
            if let subtab {
                settingsModel.selectedSubtabs[tab] = subtab
            }
        }
        NSApplication.shared.sendAction(.init((.settingsWindowSelector)), to: nil, from: nil)
    }
    // swiftlint:enable string_literals

    /// Get the selected tab and subtab selection.
    /// - Returns: The selected tab and the selected subtabs of all the tabs.
    public static func getSelection() -> (String, [String: String]) {
        (settingsModel.selectedTab, settingsModel.selectedSubtabs)
    }

}

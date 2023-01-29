//
//  SettingsCommands.swift
//  SettingsKit
//
//  Created by david-swift on 21.01.23.
//

import ColibriComponents
import SwiftUI

/// The settings commands for the menu bar.
/// It adds a menu containing all the settings tabs as other menus or buttons.
/// Settingstabs that are menus contain the subtabs as buttons.
struct SettingsCommands: Commands {

    /// The shared instance of the ``SettingsModel``.
    @StateObject private var model = SettingsModel.shared
    /// The settings tabs.
    var settings: [SettingsTab]
    /// The identifier of the subtab with the shortcut.
    var shortcutsID: String

    /// The commands.
    var body: some Commands {
        CommandGroup(replacing: .appSettings) {
            Menu(.init("Settings", comment: "Scene (Title of the settings tab picker in the commands)")) {
                ForEach(settings) { tab in
                    settingsTab(tab, shortcutsID: shortcutsID)
                }
            }
        }
    }

    /// Get the view for a settings tab in the commands.
    /// - Parameters:
    ///   - tab: The settings tab.
    ///   - shortcutsID: The identifier of the settings button with the shortcut.
    /// - Returns: A view for the settings tab in the commands.
    @ViewBuilder private func settingsTab(_ tab: SettingsTab, shortcutsID: String) -> some View {
        if case let .new(label: label) = tab.type {
            if tab.content.count > 1 {
                Menu {
                    ForEach(tab.content) { subtab in
                        if shortcutsID == subtab.id {
                            settingsSubtab(subtab, tab: tab)
                                .keyboardShortcut(.settings)
                        } else {
                            settingsSubtab(subtab, tab: tab)
                        }
                    }
                } label: {
                    label
                }
            } else {
                if shortcutsID == tab.content.first?.id {
                    tabButton(tab, label: label)
                        .keyboardShortcut(.settings)
                } else {
                    tabButton(tab, label: label)
                }
            }
        }
    }

    /// Get the commands button for a settings tab with only one subtab.
    /// - Parameters:
    ///   - tab: The settings tab.
    ///   - label: The settings tab's label.
    /// - Returns: A view containing the button for the settings tab.
    private func tabButton(_ tab: SettingsTab, label: Label<Text, Image>) -> some View {
        Button {
            model.selectedTab = tab.id
            SettingsAction.showSettings()
        } label: {
            label
        }
    }

    /// Get the commands button for a settings subtab.
    /// - Parameters:
    ///   - subtab: The settings subtab.
    ///   - tab: The settings tab of the subtab.
    /// - Returns: A view containing the button for the settings subtab.
    @ViewBuilder private func settingsSubtab(_ subtab: SettingsSubtab, tab: SettingsTab) -> some View {
        if case let .new(label: label) = subtab.type {
            Button {
                model.selectedTab = tab.id
                model.selectedSubtabs[tab.id] = subtab.id
                SettingsAction.showSettings()
            } label: {
                label
            }
        }
    }

}

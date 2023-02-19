//
//  SettingsKitScene.swift
//  SettingsKit
//
//  Created by david-swift on 21.01.23.
//

import SwiftUI

/// A structure adding the settings to another scene.
struct SettingsKitScene<Content>: Scene where Content: Scene {

    /// The shared instance of the ``SettingsModel``.
    @StateObject private var model = SettingsModel.shared
    /// The scene the settings are added to.
    var content: Content
    /// The settings tabs.
    var settings: [SettingsTab]
    /// The identifier of the settings tab with the keyboard shortcut.
    var standardID: String
    /// Modify the way symbols are displayed.
    var symbolVariant: SymbolVariants

    /// The scene.
    var body: some Scene {
        Group {
            content
            Settings {
                TabView(selection: SettingsModel.shared.selectedTab.binding { newValue in
                    model.selectedTab = newValue
                }) {
                    ForEach(settings) { tab in
                        if case let .new(label: label) = tab.type {
                            Color.clear
                                .overlay {
                                    tab
                                }
                                .tabItem {
                                    label
                                }
                        }
                    }
                }
                .frame(width: .settingsWidth, height: .settingsHeight)
                .symbolVariant(symbolVariant)
            }
        }
        .commands {
            SettingsCommands(settings: settings, shortcutsID: standardID)
        }
    }

}

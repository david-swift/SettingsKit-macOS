//
//  TestAppModel.swift
//  SettingsKit
//
//  Created by david-swift on 27.01.23.
//

import ColibriComponents
import SettingsKit
import SFSafeSymbols
import SwiftUI

/// The app model of the test app.
class TestAppModel: ObservableObject {

    /// A shared instance of the ``TestAppModel``.
    static var shared = TestAppModel()

    /// The settings.
    @Published private var settings: [SettingsTab]

    /// All the settings: the "Settings" tab + the ``settings``.
    @ArrayBuilder<SettingsTab> var allSettings: [SettingsTab] {
        SettingsTab(
            .init(
                .init("Settings", comment: "TestAppModel (Name of the settings for testing purposes)"),
                systemSymbol: .gearshape
            ),
            id: "settings-tab"
        ) {
            for subtab in tabsGeneralSubtabs {
                subtab
            }
            noSelection
        }
        .standardActions {
            VStack {
                Button("Icon Tab") {
                    self.settings.append(self.newTab)
                }
                Button("Color Tab") {
                    self.settings.append(self.colorTab)
                }
            }
        } remove: { id in
            if let id {
                self.settings.remove(at: id)
            }
        }

        for settingsTab in settings {
            settingsTab
        }
    }

    /// The subtabs in the "Setttings" tab that represent the other tabs.
    @ArrayBuilder<SettingsSubtab> private var tabsGeneralSubtabs: [SettingsSubtab] {
        for settingsTab in settings {
            if case let .new(label: label) = settingsTab.type {
                SettingsSubtab(label, id: settingsTab.id) {
                    label
                }
            }
        }
    }

    /// The view when nothing is selected in the "Settings" tab.
    private var noSelection: SettingsSubtab {
        .init(.noSelection, id: "no-selection-settings") {
            Text(
                .init(
                    "Add a new tab with the \"+\" button.",
                    comment: "TestAppModel (Description of a view without a selection for testing purposes)"
                )
            )
        }
    }

    /// Generates a new settings tab.
    var newTab: SettingsTab {
        .init(randomLabel, id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                randomLabel
            }
        }
    }

    /// Generates a new settings tab.
    var colorTab: SettingsTab {
        .init(randomLabel, id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                Color.accentColor
            }
        }
    }

    /// Generates a random label.
    private var randomLabel: Label<Text, Image> {
        var dot = false
        return .init(
            randomSymbol.rawValue.compactMap { char -> String? in
                if char == "." {
                    dot = true
                } else if !dot {
                    return String(char)
                }
                return nil
            }
            .joined(),
            systemSymbol: randomSymbol
        )
    }

    /// Chooses a random SFSymbol.
    private var randomSymbol: SFSymbol {
        .allSymbols.randomElement() ?? .gearshape
    }

    /// The intializer.
    init() {
        settings = []
        settings = [self.newTab]
    }

}

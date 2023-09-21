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
            .new(
                title: "Settings",
                icon: .gearshape
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
        } remove: { _, index in
            if let index {
                self.settings.remove(at: index)
            }
        }

        for settingsTab in settings {
            settingsTab
        }
    }

    /// The subtabs in the "Setttings" tab that represent the other tabs.
    @ArrayBuilder<SettingsSubtab> private var tabsGeneralSubtabs: [SettingsSubtab] {
        for settingsTab in settings {
            if case let .new(title: title, icon: icon) = settingsTab.type {
                SettingsSubtab(.new(title: title, icon: icon), id: settingsTab.id) {
                    Label(title, systemSymbol: icon)
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
        .init(.new(title: randomLabel.0, icon: randomLabel.1), id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                Label(randomLabel.0, systemSymbol: randomLabel.1)
            }
        }
    }

    /// Generates a new settings tab.
    var colorTab: SettingsTab {
        .init(.new(title: randomLabel.0, icon: randomLabel.1), id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                Color.accentColor
            }
        }
    }

    /// Generates a random label.
    private var randomLabel: (String, SFSymbol) {
        var dot = false
        return (
            randomSymbol.rawValue.compactMap { char -> String? in
                if char == "." {
                    dot = true
                } else if !dot {
                    return String(char)
                }
                return nil
            }
            .joined(),
            randomSymbol
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

//
//  TestAppModel.swift
//  SettingsKit
//
//  Created by david-swift on 27.01.23.
//

import SettingsKit
import SwiftUI

/// The app model of the test app.
class TestAppModel: ObservableObject {

    /// A shared instance of the ``TestAppModel``.
    static var shared = TestAppModel()

    /// The settings.
    @Published private var settings: [SettingsTab]

    /// All the settings: the "Settings" tab + the `settings`.
    @ArrayBuilder<SettingsTab> var allSettings: [SettingsTab] {
        SettingsTab(
            .new(
                title: "Settings",
                image: .init(systemName: "gearshape")
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
            if case let .new(title: title, image: icon) = settingsTab.type {
                SettingsSubtab(.new(title: title, image: icon), id: settingsTab.id) {
                    Label {
                        Text(title)
                    } icon: {
                        icon
                    }
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
        .init(.new(title: randomLabel.0, image: .init(systemName: randomLabel.1)), id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                Label(randomLabel.0, systemImage: randomLabel.1)
            }
        }
    }

    /// Generates a new settings tab.
    var colorTab: SettingsTab {
        .init(.new(title: randomLabel.0, image: .init(systemName: randomLabel.1)), id: UUID().uuidString) {
            SettingsSubtab(.noSelection, id: "no-selection-subtab") {
                Color.accentColor
            }
        }
    }

    /// Generates a random label.
    private var randomLabel: (String, String) {
        (
            "Test Tab",
            randomSymbol
        )
    }

    /// Chooses a random SFSymbol.
    private var randomSymbol: String {
        Bool.random() ? "figure.walk" : "house"
    }

    /// The intializer.
    init() {
        settings = []
        settings = [self.newTab]
    }

}

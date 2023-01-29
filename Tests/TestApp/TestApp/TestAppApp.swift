//
//  TestAppApp.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import SettingsKit
import SFSafeSymbols
import SwiftUI

/// A simple app for testing the ``SettingsKit``.
@main
struct TestAppApp: App {

    /// The app model for testing the ``SettingsKit``.
    @StateObject private var appModel = TestAppModel.shared

    /// The main view of the test app.
    var body: some Scene {
        Window("Window", id: "Window") {
            ContentView()
        }
        .settings {
            for settingsTab in appModel.allSettings {
                settingsTab
            }
        }
    }

}

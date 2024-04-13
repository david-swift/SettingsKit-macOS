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
    /// Whether the sidebar design should be used for the settings window.
    @AppStorage("sidebar-design")
    var sidebarDesign = false
    /// The currently selected tab.
    @AppStorage("tab")
    var selectedTab = ""

    /// The main view of the test app.
    var body: some Scene {
        Window("Window", id: "Window") {
            ContentView()
            Button("Select Test") {
                selectedTab = "test"
            }
        }
        .settings(design: sidebarDesign ? .sidebar : .default, selectedTab: $selectedTab) {
            for settingsTab in appModel.allSettings {
                settingsTab
            }
            SettingsTab(.new(title: "Test", icon: .arrowLeftCircle), id: "test") {
                SettingsSubtab(.noSelection, id: "subtab") {
                    let width = 500.0
                    let height = 100.0
                    Toggle("Sidebar Design", isOn: $sidebarDesign)
                        .frame(width: width, height: height)
                }
            }
            .frame()
        }
    }

}

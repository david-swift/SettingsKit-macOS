//
//  Scene.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import ColibriComponents
import SwiftUI

extension Scene {

    /// Adds the settings to a scene.
    /// - Parameter _: The settings tabs of the settings window.
    /// - Returns: The scene with the settings.
    ///
    /// Use it as a modifier for a scene:
    /// ```swift
    /// WindowGroup {
    ///     ContentView()
    /// }
    /// .settings {
    ///     SettingsTab(.init("General", systemSymbol: .gearshape), id: "general-tab") {
    ///         GeneralTabContent()
    ///     }
    /// }
    /// ```
    public func settings(@ArrayBuilder<SettingsTab> _ settings: () -> [SettingsTab]) -> some Scene {
        let (settings, standardID) = getSettings(settings())
        return SettingsKitScene(content: self, settings: settings, standardID: standardID)
    }

    /// Converts the settings to an array containing only the valid settings.
    /// - Parameter settings: The settings in the form defined by the coder.
    /// - Returns: The settings in the settings form and a string with the identifier of the standard tab.
    private func getSettings(_ settings: [SettingsTab]) -> ([SettingsTab], String) {
        var newTabs = settings.filter { tab in
            switch tab.type {
            case .new:
                return true
            default:
                return false
            }
        }
        let otherTabs = settings.filter { tab in
            !newTabs.contains { tab.id == $0.id }
        }
        for tab in otherTabs {
            if case let .extend(id: id) = tab.type {
                for index in newTabs.indices where newTabs[safe: index]?.id == id {
                    newTabs[safe: index]?.content += tab.content
                }
            }
        }
        var standardSettingsSubtab: String = .init()
        for tab in newTabs.reversed() {
            for subtab in tab.content.reversed() where subtab.standard {
                standardSettingsSubtab = subtab.id
            }
        }
        return (newTabs, standardSettingsSubtab)
    }

}

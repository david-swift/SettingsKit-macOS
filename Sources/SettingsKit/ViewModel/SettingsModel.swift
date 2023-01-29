//
//  SettingsModel.swift
//  SettingsKit
//
//  Created by david-swift on 21.01.23.
//

import Foundation

/// A class containing all the information about the settings window state.
final class SettingsModel: ObservableObject {

    /// A shared instance of the ``SettingsModel``.
    static var shared = SettingsModel()

    /// The identifier of the selected tab.
    @Published var selectedTab: String
    /// The identifiers of the selected subtabs.
    @Published var selectedSubtabs: [String: String] {
        didSet {
            UserDefaults.standard.set(selectedSubtabs, forKey: .selectedSubtabs)
        }
    }

    /// The initializer. It fetches the stored user defaults.
    init() {
        selectedTab = .init()
        selectedSubtabs = UserDefaults.standard.value(forKey: .selectedSubtabs) as? [String: String] ?? [:]
    }

}

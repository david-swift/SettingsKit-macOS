//
//  GeneralSettings.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import SwiftUI

/// The settings test view for general settings.
struct GeneralSettings: View {

    /// A test storage value.
    @AppStorage("show-first-name")
    var firstNameBeforeLastName = true
    /// A test storage value.
    @AppStorage("sort-by")
    var sortByLastName = true
    /// A test storage value.
    @AppStorage("prefer-nicknames")
    var preferNicknames = true
    /// A test storage value.
    @AppStorage("show-siri-suggestions")
    var showSiriSuggestions = true
    /// A test storage value which switches between the default and sidebar settings design.
    @AppStorage("default-settings-design")
    var defaultSettingsDesign = true

    /// The view's body.
    var body: some View {
        let width = 500.0
        Form {
            Picker("Show First Name:", selection: $firstNameBeforeLastName) {
                Text("Before last name")
                    .tag(true)
                Text("Following last name")
                    .tag(false)
            }
            .pickerStyle(.radioGroup)
            Picker("Sort By:", selection: $sortByLastName) {
                Text("Last Name")
                    .tag(true)
                Text("First Name")
                    .tag(false)
            }
            Toggle("Prefer nicknames", isOn: $preferNicknames)
            Toggle("Show Siri Suggestions", isOn: $showSiriSuggestions)
            Section {
                Picker("Settings Window Design:", selection: $defaultSettingsDesign) {
                    Text("Default macOS Design")
                        .tag(true)
                    Text("Sidebar Design")
                        .tag(false)
                }
                .pickerStyle(.radioGroup)
            }
        }
        .frame(width: width)
        .fixedSize()
    }
}

#Preview {
    GeneralSettings()
}

//
//  ExamplesApp.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import SettingsKit
import SwiftUI

/// An app for showcasing the usage of the SettingsKit package.
@main
struct ExamplesApp: App {

    /// A test storage value.
    @AppStorage("accounts-count")
    var accountsCount = 0
    /// A test storage value.
    @AppStorage("show-first-name")
    var firstNameBeforeLastName = true
    /// A test storage value.
    @AppStorage("default-settings-design")
    var defaultSettingsDesign = true

    /// The app's body.
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .settings(design: defaultSettingsDesign ? .default : .sidebar) {
            SettingsTab(.new(title: "General", icon: .gearshape), id: "general", color: .gray) {
                SettingsSubtab(.noSelection, id: "general") {
                    GeneralSettings()
                        .padding()
                }
            }
            .frame()
            SettingsTab(.new(title: "Accounts", icon: .at), id: "accounts") {
                for account in 0..<accountsCount {
                    SettingsSubtab(.new(title: "Account \(account + 1)", icon: .personFill), id: "account-\(account)") {
                        AccountView(account: account)
                    }
                }
            }
            .standardActions {
                accountsCount += 1
            } remove: { _, _ in
                if accountsCount > 0 {
                    accountsCount -= 1
                }
            }
            SettingsTab(.new(title: "Advanced", icon: .gearshape2), id: "advanced") {
                SettingsSubtab(.noSelection, id: "advanced") {
                    Text("Advanced Settings")
                }
            }
        }
    }
}

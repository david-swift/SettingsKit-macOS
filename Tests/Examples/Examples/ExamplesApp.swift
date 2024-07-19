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
    @State private var accounts = [0]
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
            SettingsTab(.new(title: "General", image: .init(systemName: "gearshape")), id: "general", color: .gray) {
                SettingsSubtab(.noSelection, id: "general") { GeneralSettings() }
            }
            .frame()
            if defaultSettingsDesign {
                accountsTab
                    .standardActions {
                        self.accounts.append((self.accounts.last ?? -1) + 1)
                    } remove: { _, index in
                        if let index {
                            self.accounts.remove(at: index)
                        }
                    }
            } else {
                accountsTab.automaticSubtabSelection(false)
            }
            SettingsTab(.new(title: "Advanced", image: .init(systemName: "gearshape.2")), id: "advanced") {
                SettingsSubtab(.noSelection, id: "advanced") {
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Text("Advanced Settings")
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
            .frame()
        }
    }

    /// The sample "Accounts" tab.
    private var accountsTab: SettingsTab {
        .init(.new(title: "Accounts", image: .init(systemName: "at")), id: "accounts") {
            for account in self.accounts {
                SettingsSubtab(
                    .new(title: "Account \(account + 1)", image: .init(systemName: "person.fill")),
                    id: "account-\(account)"
                ) {
                    if defaultSettingsDesign {
                        AccountView(account: account)
                    } else {
                        AccountView(account: account)
                            .toolbar {
                                Button("Delete Account") {
                                    self.accounts = self.accounts.filter { $0 != account }
                                }
                            }
                    }
                }
            }
        }
        .top {
            Section {
                HStack {
                    Text("Accounts")
                    Spacer()
                    Button("Add Account") {
                        self.accounts.append((self.accounts.last ?? -1) + 1)
                    }
                }
            }
        }
    }
}

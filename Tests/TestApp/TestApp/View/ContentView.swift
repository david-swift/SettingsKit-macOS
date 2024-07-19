//
//  ContentView.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import SettingsKit
import SwiftUI

/// The main view of the test app.
struct ContentView: View {

    /// The body of the ``ContentView``.
    var body: some View {
        if #available(macOS 14, *) {
            SettingsLink()
                .labelStyle(.titleOnly)
        } else {
            // swiftlint:disable string_literals
            Button("Show Settings") {
                SettingsAction.showSettings()
            }
            // swiftlint:enable string_literals
        }
    }

}

/// Previews for the ``ContentView``.
struct ContentView_Previews: PreviewProvider {

    /// Previews for the ``ContentView``.
    static var previews: some View {
        ContentView()
    }

}

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
        Button(.init("Show Settings", comment: "ContentView (Button for showing the settings for testing purposes)") ) {
            SettingsAction.showSettings()
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

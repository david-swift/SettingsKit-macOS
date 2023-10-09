//
//  ContentView.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import SwiftUI

/// The main window only displaying a "Hello, world!" screen.
/// Navigate to "Examples" > "Settings..." to open the settings.
struct ContentView: View {

    /// The view's body.
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .accessibilityHidden(true)
            Text("Hello, world!")
        }
        .padding()
    }

}

#Preview {
    ContentView()
}

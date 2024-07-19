//
//  CustomToolbarButton.swift
//  SettingsKit
//
//  Created by david-swift on 09.06.24.
//

import SwiftUI

/// The button style of a custom toolbar action button.
struct CustomToolbarButton: ButtonStyle {

    /// Create a button from a configuration.
    /// - Parameter configuration: The button configuration.
    /// - Returns: A view containing the button.
    func makeBody(configuration: Configuration) -> some View {
        let scale = 0.6
        return configuration.label
            .foregroundColor(configuration.isPressed ? .accentColor : .primary)
            .scaleEffect(configuration.isPressed ? scale : 1)
            .animation(.default, value: configuration.isPressed)
    }

}

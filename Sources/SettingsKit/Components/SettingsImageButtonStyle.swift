//
//  SettingsImageButtonStyle.swift
//  SettingsKit
//
//  Created by david-swift on 19.01.23.
//

import SwiftUI

/// The button style of an image picker in the settings.
/// If the button is not the selected picker element, there is a white overlay.
public struct SettingsImageButtonStyle: ButtonStyle {

    /// Whether the button is the selected picker element.
    var selected: Bool

    /// Build the image picker button style.
    /// - Parameter configuration: The button's configuration.
    /// - Returns: A view containing the button.
    public func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .buttonStyle(.plain)
            .overlay(
                .white.opacity(selected ? .zero : (configuration.isPressed ? .isPressedOpacity : .notPressedOpacity))
            )
            .cornerRadius(.imageCornerRadius)
    }

}

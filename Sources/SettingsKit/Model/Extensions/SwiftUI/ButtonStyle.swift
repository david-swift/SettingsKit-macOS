//
//  ButtonStyle.swift
//  SettingsKit
//
//  Created by david-swift on 19.01.23.
//

import SwiftUI

extension ButtonStyle where Self == SettingsImageButtonStyle {

    /// A button style for an image picker in the settings.
    /// It adds a white layer in front of the image to show that it is not selected.
    /// - Parameter isSelected: Whether the image is selected.
    /// - Returns: The button style.
    ///
    /// You can use it with a button with an image label:
    /// ```swift
    /// Button {
    ///     print("Hello, world!")
    /// } label: {
    ///     Image("Image Name")
    /// }
    /// .buttonStyle(.settingsImage(isSelected: selected))
    /// ```
    public static func settingsImage(isSelected: Bool) -> Self {
        .init(selected: isSelected)
    }

}

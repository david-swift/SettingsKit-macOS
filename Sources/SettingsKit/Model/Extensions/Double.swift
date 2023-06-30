//
//  Double.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//
//  swiftlint:disable no_magic_numbers

import Foundation

extension Double {

    /// The opacity of the white layer on a ``SettingsImageButtonStyle`` button when the button is not pressed.
    internal static var notPressedOpacity: Self { 0.7 }
    /// The opacity of the white layer on a ``SettingsImageButtonStyle`` button when the button is pressed.
    internal static var isPressedOpacity: Self { 0.4 }

}

//  swiftlint:enable no_magic_numbers

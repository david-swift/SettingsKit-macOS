//
//  SettingsWindowDesign.swift
//  SettingsKit
//
//  Created by david-swift on 17.09.2023.
//

import Foundation

/// The design of the settings window can be either the default macOS settings window design or a modern sidebar design.
public enum SettingsWindowDesign {

    /// The default macOS settings design with a tab bar.
    case `default`
    /// A modern settings design with a sidebar.
    @available(macOS 13, *)
    case sidebar

}

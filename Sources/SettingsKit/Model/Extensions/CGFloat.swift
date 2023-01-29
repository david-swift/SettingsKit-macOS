//
//  CGFloat.swift
//  SettingsKit
//
//  Created by david-swift on 19.01.23.
//
//  swiftlint:disable no_magic_numbers

import Foundation

extension CGFloat {

    /// The corner radius of the images.
    internal static var imageCornerRadius: Self { 5 }
    /// The width of a settings window.
    internal static var settingsWidth: Self { 800 }
    /// The height of a settings window.
    internal static var settingsHeight: Self { 500 }
    /// The minimum width of a sidebar in a settings tab.
    internal static var settingsSidebarWidth: Self { 200 }
    /// The minimum width of the content in a settings tab.
    internal static var settingsContentWidth: Self { 500 }
    /// The height of a custom toolbar.
    internal static var customToolbarHeight: Self { 40 }
    /// The padding of the actions in the sidebar.
    internal static var actionsPadding: Self { 10 }

}

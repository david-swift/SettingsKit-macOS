//
//  SettingsSubtab.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import SwiftUI

/// A tab in a settings tab.
public struct SettingsSubtab: Identifiable, View {

    /// The tab's identifier.
    public let id: String
    /// The tab's type.
    public var type: TabType
    /// The tab's view.
    public var content: any View
    /// Whether the subtab is the standard tab.
    var standard = false

    /// The view's body.
    /// It is an AnyView wrapped around the ``content``.
    public var body: some View {
        AnyView(
            content
        )
    }

    /// The label of a custom tab, or else nil.
    public var label: Label<Text, Image>? {
        guard case let .new(label: label) = type else {
            return nil
        }
        return label
    }

    /// The initializer.
    /// - Parameters:
    ///   - type: The tab type of the settings subtab.
    ///   - id: The identifier.
    ///   - content: The content of the settings subtab.
    public init(_ type: TabType, id: String, @ViewBuilder content: () -> any View) {
        self.id = id
        self.type = type
        self.content = content()
    }

    /// An initializer for a custom settings subtab.
    /// - Parameters:
    ///   - label: The label of the custom settings subtab.
    ///   - id: The identifier.
    ///   - content: The content of the custom settings subtab.
    public init(_ label: Label<Text, Image>, id: String, @ViewBuilder content: () -> any View) {
        self.init(.new(label: label), id: id, content: content)
    }

    /// Adds the settings shortcut to the subtab and returns the new one.
    /// - Returns: The new subtab with the shortcut.
    public func shortcut() -> Self {
        var newSubtab = self
        newSubtab.standard = true
        return newSubtab
    }

}

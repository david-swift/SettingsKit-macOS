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
    /// The tab's color.
    public var color: Color
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
        guard case let .new(title: title, image: image) = type else {
            return nil
        }
        return .init {
            Text(title)
        } icon: {
            image
        }
    }

    /// The label for the sidebar style.
    @ViewBuilder public var sidebarLabel: some View {
        if case let .new(title: title, image: image) = type {
            HStack {
                image
                    .sidebarSettingsIcon(color: color)
                    .accessibilityHidden(true)
                Text(title)
            }
        }
    }

    /// The initializer.
    /// - Parameters:
    ///   - type: The tab type of the settings subtab.
    ///   - id: The identifier.
    ///   - color: The tab's color in the sidebar style.
    ///   - content: The content of the settings subtab.
    public init(_ type: TabType, id: String, color: Color = .blue, @ViewBuilder content: () -> any View) {
        self.id = id
        self.type = type
        self.color = color
        self.content = content()
    }

}

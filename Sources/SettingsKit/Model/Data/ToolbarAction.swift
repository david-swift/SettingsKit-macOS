//
//  ToolbarAction.swift
//  SettingsKit
//
//  Created by david-swift on 09.06.24.
//

import SwiftUI

/// A button in a custom toolbar.
public struct ToolbarAction: ToolbarActionProtocol, Identifiable {

    /// The identifier of the toolbar action.
    public let id: UUID
    /// The icon of the toolbar action.
    var icon: Image
    /// The action's title.
    var title: LocalizedStringKey
    /// The action.
    var action: () -> Void
    /// Whether the toggle is activated.
    public var isOn: Bool

    /// The initializer.
    /// - Parameters:
    ///   - title: The action's title.
    ///   - symbol: The SF symbol.
    ///   - action: The action's description.
    public init(_ title: LocalizedStringKey, symbol: Image, action: @escaping () -> Void) {
        id = .init()
        self.icon = symbol
        self.title = title
        self.action = action
        isOn = false
    }

    /// The action's view.
    /// - Parameter padding: The horizontal padding around the button.
    /// - Returns: A view containing the action button.
    public func body(padding: Edge.Set) -> AnyView {
        .init(
            Button {
                action()
            } label: {
                Label {
                    Text(title)
                } icon: {
                    icon
                }
                .customToolbarItem(padding: padding)
            }
            .buttonStyle(CustomToolbarButton())
            .help(title)
        )
    }

    /// Add a binding to convert this action into a toggle.
    /// - Parameter isOn: Whether the toggle is on.
    /// - Returns: The toolbar action as a toggle.
    public func isOn(_ isOn: Bool) -> Self {
        var newSelf = self
        newSelf.isOn = isOn
        return newSelf
    }

}

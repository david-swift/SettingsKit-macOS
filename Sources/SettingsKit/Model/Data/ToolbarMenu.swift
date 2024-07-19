//
//  ToolbarMenu.swift
//  SettingsKit
//
//  Created by david-swift on 02.08.2023.
//  Edited by Daniel Nguyen on 05.08.2023.
//

import SwiftUI

/// A button in a custom toolbar.
public struct ToolbarMenu<Content>: ToolbarActionProtocol where Content: View {

    /// The identifier of the toolbar menu.
    public let id: UUID
    /// The icon of the toolbar menu.
    var icon: Image
    /// The menu's title.
    var title: LocalizedStringKey
    /// The content.
    var content: Content
    /// A toolbar menu is never activated.
    public var isOn: Bool { false }

    /// The initializer.
    /// - Parameters:
    ///   - title: The action's title.
    ///   - symbol: The SF symbol.
    ///   - content: The content.
    public init(_ title: LocalizedStringKey, symbol: Image, @ViewBuilder content: @escaping () -> Content) {
        id = .init()
        self.icon = symbol
        self.title = title
        self.content = content()
    }

    /// The action's view.
    /// - Parameter padding: The horizontal padding around the button.
    /// - Returns: A view containing the action button.
    public func body(padding: Edge.Set) -> AnyView {
        let width = 20.0
        let paddingValue = 5.0
        if #available(macOS 12, *) {
            return .init(
                Menu {
                    content
                } label: {
                    Label {
                        Text(title)
                    } icon: {
                        icon
                    }
                    .customToolbarItem(padding: padding)
                    .border(.red)
                }
                .menuStyle(.borderlessButton)
                .menuIndicator(.hidden)
                .frame(width: width)
                .padding(padding, paddingValue)
                .buttonStyle(CustomToolbarButton())
                .help(title)
            )
        } else {
            return .init(
                MenuButton(title) {
                    content
                }
                .buttonStyle(.borderless)
            )
        }
    }

}

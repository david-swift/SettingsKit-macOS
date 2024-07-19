//
//  ToolbarActionProtocol.swift
//  SettingsKit
//
//  Created by david-swift on 09.06.24.
//

import SwiftUI

/// A protocol for items in a custom or freeform toolbar's group.
public protocol ToolbarActionProtocol {

    /// The toolbar item's identifier.
    var id: UUID { get }
    /// Whether the toolbar item is activated (background visible).
    var isOn: Bool { get }
    /// The body view.
    /// - Parameter padding: Padding.
    /// - Returns: The view.
    func body(padding: Edge.Set) -> AnyView

}

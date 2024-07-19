//
//  ToolbarGroup.swift
//  SettingsKit
//
//  Created by david-swift on 09.06.24.
//

import SwiftUI

/// A group of buttons in a custom toolbar.
public struct ToolbarGroup: Identifiable, View {

    /// The identifier of the toolbar action group.
    public let id: UUID
    /// Actions  in the group.
    var actions: [ToolbarActionProtocol]
    /// The content view.
    var content: AnyView?
    /// Whether there is a spacer after the group.
    var addSpacer: Bool
    /// Whether the toolbar group is hovered. If true, the background color changes.
    @State private var hover = false

    /// The group's view.
    public var body: some View {
        HStack {
            ForEach(actions, id: \.id) { action in
                let index = actions.firstIndex { $0.id == action.id } ?? 0
                if index != 0 {
                    Divider()
                }
                action.body(padding: padding(index: index))
            }
            if let content {
                if !actions.isEmpty {
                    Divider()
                }
                let height = 30.0
                content
                    .padding(.vertical)
                    .frame(height: height)
            }
        }
        .onHover { hover = $0 }
        if addSpacer {
            Spacer()
        }
    }

    /// The initializer of ``ToolbarGroup``.
    /// - Parameters:
    ///   - actions: The actions.
    ///   - body: The body.
    public init<Content>(
        @ArrayBuilder<ToolbarActionProtocol> _ actions: () -> [ToolbarActionProtocol] = { [] },
        @ViewBuilder body: @escaping () -> Content? = { nil as EmptyView? }
    ) where Content: View {
        id = .init()
        self.actions = actions()
        addSpacer = false
        if let body = body() {
            content = .init(body)
        } else {
            content = nil
        }
    }

    /// Create a spacer after this action.
    /// - Returns: The action with the spacer.
    public func spacer() -> Self {
        var newAction = self
        newAction.addSpacer = true
        return newAction
    }

    /// Get the padding of the action button at a certain position.
    /// - Parameter index: The position.
    /// - Returns: A set containing the edges with padding.
    private func padding(index: Int) -> Edge.Set {
        if actions.count <= 1 {
            return .all
        } else if index == 0 {
            return .leading
        } else if index == actions.count - 1 {
            return .trailing
        } else {
            return []
        }
    }

}

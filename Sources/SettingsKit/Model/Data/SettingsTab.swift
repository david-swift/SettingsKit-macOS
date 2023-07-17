//
//  SettingsTab.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import ColibriComponents
import SwiftUI

/// A tab in the settings window.
public struct SettingsTab: Identifiable, View {

    /// The instance of the settings model.
    @StateObject private var model = SettingsModel.shared
    /// The tab's identifier.
    public let id: String
    /// The tab's type.
    public var type: TabType
    /// The tab's content.
    public var content: [SettingsSubtab]
    /// The sidebar actions view.
    public var sidebarActions: [ToolbarGroup]
    /// The settings window's width.
    public var windowWidth: CGFloat? = .settingsWidth
    /// The settings window's height.
    public var windowHeight: CGFloat? = .settingsHeight

    /// The view containing all the subtabs.
    public var body: some View {
        if content.count <= 1 && sidebarActions.isEmpty {
            content.first
                .frame(width: windowWidth, height: windowHeight)
        } else {
            HSplitView {
                sidebar
                contentView
            }
            .frame(width: .settingsWidth, height: .settingsHeight)
        }
    }

    /// The tab's sidebar containing all the subtabs.
    private var sidebar: some View {
        VStack {
            sidebarList
                .overlay(alignment: .bottom) {
                    Divider()
                }
            if !sidebarActions.isEmpty {
                sidebarActions
                    .padding(.bottom, .actionsPadding)
            }
        }
        .background(.background)
        .frame(height: .settingsHeight)
        .frame(minWidth: .settingsSidebarWidth)
    }

    /// The list in the tab's sidebar.
    private var sidebarList: some View {
        List(
            content,
            selection: (model.selectedSubtabs[id] ?? .init()).binding { newValue in
                model.selectedSubtabs[id] = newValue
            }
        ) { subtab in
            if #available(macOS 13, *) {
                subtab.label
                    .tag(subtab.id)
                    .listRowSeparator(.hidden)
            } else {
                subtab.label
                    .tag(subtab.id)
            }
        }
    }

    /// The selected subtab's content.
    private var contentView: some View {
        Form {
            if let first = content.first(where: { $0.id == model.selectedSubtabs[id] }) {
                first
            } else {
                content.first { $0.type.isNoSelection }
            }
        }
        .frame(minWidth: .settingsContentWidth, maxWidth: .infinity)
    }

    /// The initializer.
    /// - Parameters:
    ///   - type: The tab type of the settings tab.
    ///   - id: The identifier.
    ///   - content: The content of the settings tab.
    public init(
        _ type: TabType,
        id: String,
        @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
    ) {
        self.id = id
        self.type = type
        self.content = content()
        sidebarActions = []
    }

    /// An initializer for a custom settings tav.
    /// - Parameters:
    ///   - label: The label of the custom settings tab.
    ///   - id: The identifier.
    ///   - content: The content of the custom settings tab.
    public init(
        _ label: Label<Text, Image>,
        id: String,
        @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
    ) {
        self.init(.new(label: label), id: id, content: content)
    }

    /// Adds the settings shortcut to the first subtab.
    /// - Returns: The new tab with the shortcut.
    public func shortcut() -> Self {
        var newTab = self
        newTab.content[safe: 0] = newTab.content.first?.shortcut()
        return newTab
    }

    /// Adds actions to the settings sidebar.
    /// - Parameter content: The actions.
    /// - Returns: The new tab with the actions.
    public func actions(@ArrayBuilder<ToolbarGroup> content: () -> [ToolbarGroup]) -> Self {
        actions(content: content())
    }

    /// Add actions to the settings sidebar by providing an array.
    /// - Parameter content: The actions as an array..
    /// - Returns: The new tab with the actions.
    public func actions(content: [ToolbarGroup]) -> Self {
        var newTab = self
        newTab.sidebarActions = content
        return newTab
    }

    /// The standard set of actions with an add button, a remove button and optionally an options button.
    /// - Parameters:
    ///   - add: The action that is called when the add button is pressed.
    ///   - remove: The action that is called when the remove button is pressed, giving the the selected subtab's index.
    ///   - options: The action that is called when the options button is pressed.
    ///              If it is nil, there is no options button.
    /// - Returns: The new tab with the actions.
    public func standardActions(
        add: @escaping () -> Void,
        remove: @escaping (Int?) -> Void,
        options: (() -> Void)? = nil
    ) -> Self {
        actions {
            ToolbarGroup {
                ToolbarAction(
                    .init(localized: "Add", comment: "SettingsTab (Label of the standard \"Add\" action)"),
                    systemSymbol: .plus,
                    action: add
                )
                ToolbarAction(
                    .init(localized: "Remove", comment: "SettingsTab (Label of the standard \"Remove\" action)"),
                    systemSymbol: .minus
                ) {
                    remove(content.firstIndex { $0.id == SettingsModel.shared.selectedSubtabs[id] })
                }
            }
            .spacer()
            if let options {
                ToolbarGroup {
                    ToolbarAction(
                        .init(
                            localized: "Options",
                            comment: "SettingsTab (Label of the standard \"Options\" action)"
                        ),
                        systemSymbol: .ellipsis,
                        action: options
                    )
                }
            }
        }
    }

    /// Set the window's width and height when this tab is open.
    /// This is being ignored if there is more than one subtab or if there are settings actions.
    /// - Parameters:
    ///   - width: The width. If nil, the window uses the content's width.
    ///   - height: The height. If nil, the window uses the content's height.
    /// - Returns: The settings tab with the new window size.
    public func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self {
        var newSelf = self
        newSelf.windowWidth = width
        newSelf.windowHeight = height
        return newSelf
    }

    /// Set the window's width when this tab is open without affecting the height.
    /// This is being ignored if there is more than one subtab or if there are settings actions.
    /// - Parameter width: The width. If nil, the window uses the content's width.
    /// - Returns: The settings tab with the new window size.
    public func width(_ width: CGFloat? = nil) -> Self {
        var newSelf = self
        newSelf.windowWidth = width
        return newSelf
    }

    /// Set the window's height when this tab is open without affecting the width.
    /// This is being ignored if there is more than one subtab or if there are settings actions.
    /// - Parameter height: The height. If nil, the window uses the content's height.
    /// - Returns: The settings tab with the new window size.
    public func height(_ height: CGFloat? = nil) -> Self {
        var newSelf = self
        newSelf.windowHeight = height
        return newSelf
    }

}

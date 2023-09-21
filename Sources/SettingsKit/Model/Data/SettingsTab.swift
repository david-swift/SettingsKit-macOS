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
    /// The tab's color in the sidebar design.
    public var color: Color
    /// The tab's content.
    public var content: [SettingsSubtab]
    /// The sidebar actions view.
    public var sidebarActions: [ToolbarGroup]
    /// The settings window's width.
    public var windowWidth: CGFloat? = .settingsWidth
    /// The settings window's height.
    public var windowHeight: CGFloat? = .settingsHeight

    /// The tab's content, but without the subtabs with the ``TabType.noSelection`` type.
    private var contentWithoutNoSelectionSubtabs: [SettingsSubtab] {
        content.filter { !$0.type.isNoSelection }
    }

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
                .overlay(alignment: .bottom) { Divider() }
            if !sidebarActions.isEmpty {
                sidebarActions.padding(.bottom, .actionsPadding)
            }
        }
        .background(.background)
        .frame(height: .settingsHeight)
        .frame(minWidth: .settingsSidebarWidth)
    }

    /// The list in the tab's sidebar.
    private var sidebarList: some View {
        Group {
            if #available(macOS 13, *) {
                let notOptional = model.selectedSubtabs[id] ?? ""
                List(
                    contentWithoutNoSelectionSubtabs,
                    selection: notOptional.binding { newValue in
                        model.selectedSubtabs[id] = newValue
                    }
                ) { subtab in
                    listContent(subtab: subtab)
                }
            } else {
                List(
                    contentWithoutNoSelectionSubtabs,
                    selection: model.selectedSubtabs[id].binding { newValue in
                        model.selectedSubtabs[id] = newValue
                    }
                ) { subtab in
                    listContent(subtab: subtab)
                }
            }
        }
        .onChange(of: model.selectedSubtabs[id]) { newValue in
            if !contentWithoutNoSelectionSubtabs.contains(where: { $0.id == newValue }) {
                updateSubtabSelection(ids: contentWithoutNoSelectionSubtabs.map { $0.id })
            }
        }
        .onChange(of: contentWithoutNoSelectionSubtabs.map { $0.id }) { updateSubtabSelection(ids: $0) }
        .onAppear { updateSubtabSelection(ids: contentWithoutNoSelectionSubtabs.map { $0.id }) }
    }

    /// The body if the sidebar layout is active.
    @available(macOS 13, *)
    @ViewBuilder var sidebarBody: some View {
        if content.count <= 1 { body } else {
            NavigationStack {
                Form {
                    ForEach(content) { content in
                        if !content.type.isNoSelection {
                            NavigationLink(value: content.id) { content.sidebarLabel }
                        }
                    }
                    if !sidebarActions.isEmpty {
                        let bottomPadding = 5.0
                        sidebarActions
                            .padding(.bottom, bottomPadding)
                    }
                }
                .formStyle(.grouped)
                .navigationDestination(for: String.self) { content[id: $0]?.body }
            }
        }
    }

    /// The selected subtab's content.
    private var contentView: some View {
        Form {
            if let first = contentWithoutNoSelectionSubtabs.first(where: { $0.id == model.selectedSubtabs[id] }) {
                first
            } else {
                content.first { $0.type.isNoSelection }
            }
        }
        .frame(minWidth: .settingsContentWidth, maxWidth: .infinity)
    }

    /// The label of a custom tab, or else nil.
    public var label: Label<Text, Image>? {
        guard case let .new(title: title, icon: icon) = type else {
            return nil
        }
        return .init(title, systemSymbol: icon)
    }

    /// The label in the sidebar.
    @ViewBuilder public var sidebarLabel: some View {
        if case let .new(title: title, icon: icon) = type {
            HStack {
                Image(systemSymbol: icon)
                    .sidebarSettingsIcon(color: color)
                    .accessibilityHidden(true)
                Text(title)
            }
        }
    }

    /// The initializer.
    /// - Parameters:
    ///   - type: The tab type of the settings tab.
    ///   - id: The identifier.
    ///   - color: The tab's color in the settings window with the sidebar design.
    ///   - content: The content of the settings tab.
    public init(
        _ type: TabType,
        id: String,
        color: Color = .blue,
        @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
    ) {
        self.id = id
        self.type = type
        self.content = content()
        self.color = color
        sidebarActions = []
    }

    /// A row in the sidebar list.
    /// - Parameter subtab: The subtab of the row.
    /// - Returns: The row.
    @ViewBuilder
    private func listContent(subtab: SettingsSubtab) -> some View {
        if #available(macOS 13, *) {
            subtab.label
                .tag(subtab.id)
                .listRowSeparator(.hidden)
        } else {
            subtab.label
                .tag(subtab.id)
        }
    }

    /// Update the selection of the subtab.
    /// - Parameter ids: The identifiers of the subtabs.
    private func updateSubtabSelection(ids: [String]) {
        if let first = ids.first(where: { id in
            !content.contains { $0.id == id }
        }) {
            model.selectedSubtabs[id] = first
        } else if content.count > ids.count {
            let index = contentWithoutNoSelectionSubtabs.firstIndex { $0.id == model.selectedSubtabs[id] }
            if let after = ids[safe: index ?? ids.count] {
                model.selectedSubtabs[id] = after
            } else if let before = ids[safe: (index ?? 0) - 1] {
                model.selectedSubtabs[id] = before
            } else {
                model.selectedSubtabs[id] = ids.last ?? ""
            }
        } else if !ids.contains(model.selectedSubtabs[id] ?? ""), let last = ids.last {
            model.selectedSubtabs[id] = last
        }
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

    /// The standard set of actions with an add menu, a remove button and optionally an options button.
    /// - Parameters:
    ///   - add: The menu that is opened when the add button is pressed.
    ///   - remove: The action that is called when the remove button is pressed, giving the the selected subtab's index.
    ///   - options: The action that is called when the options button is pressed.
    ///              If it is nil, there is no options button.
    /// - Returns: The new tab with the actions.
    public func standardActions<ContentView>(
        @ViewBuilder add: @escaping () -> ContentView,
        remove: @escaping (Int?) -> Void,
        options: (() -> Void)? = nil
    ) -> Self where ContentView: View {
        actions {
            ToolbarGroup {
                ToolbarMenu(
                    .init(
                        localized: "Add",
                        comment: "SettingsTab (Label of the standard \"Add\" action)"
                    ),
                    systemSymbol: .plus
                ) {
                    add()
                }
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

//
//  SettingsTab+.swift
//  SettingsKit
//
//  Created by david-swift on 09.10.2023.
//

import SwiftUI

extension SettingsTab {

    /// Wrap the view with the required observers.
    /// - Parameter _:  The view.
    /// - Returns: The view with observers.
    func contentView<Content>(@ViewBuilder _ content: () -> Content) -> some View where Content: View {
        content()
            .onChange(of: model.selectedSubtabs[id]) { newValue in
                if !contentWithoutNoSelectionSubtabs.contains(where: { $0.id == newValue }) {
                    updateSubtabSelection(ids: contentWithoutNoSelectionSubtabs.map { $0.id })
                }
            }
            .onChange(of: contentWithoutNoSelectionSubtabs.map { $0.id }) { updateSubtabSelection(ids: $0) }
            .onAppear { updateSubtabSelection(ids: contentWithoutNoSelectionSubtabs.map { $0.id }) }
    }

    /// A row in the sidebar list.
    /// - Parameter subtab: The subtab of the row.
    /// - Returns: The row.
    @ViewBuilder
    func listContent(subtab: SettingsSubtab) -> some View {
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
    func updateSubtabSelection(ids: [String]) {
        if let first = ids.first(where: { id in
            !content.contains { $0.id == id }
        }), autoSelect {
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
    ///   - remove: The action that is called when the remove button is pressed,
    ///             giving the the selected subtab's id and index.
    ///   - options: The action that is called when the options button is pressed.
    ///              If it is nil, there is no options button.
    /// - Returns: The new tab with the actions.
    public func standardActions(
        add: @escaping () -> Void,
        remove: @escaping (String?, Int?) -> Void,
        options: (() -> Void)? = nil
    ) -> Self {
        actions {
            ToolbarGroup {
                ToolbarAction(
                    "Add",
                    symbol: .init(systemName: "plus"),
                    action: add
                )
                ToolbarAction(
                    "Remove",
                    symbol: .init(systemName: "minus")
                ) {
                    let index = content.firstIndex { $0.id == SettingsModel.shared.selectedSubtabs[id] }
                    remove(content[safe: index]?.id, index)
                }
            }
            .spacer()
            if let options {
                ToolbarGroup {
                    ToolbarAction(
                        "Options",
                        symbol: .init(systemName: "ellipsis"),
                        action: options
                    )
                }
            }
        }
    }

    /// The standard set of actions with an add menu, a remove button and optionally an options button.
    /// - Parameters:
    ///   - add: The menu that is opened when the add button is pressed.
    ///   - remove: The action that is called when the remove button is pressed,
    ///             giving the the selected subtab's id and index.
    ///   - options: The action that is called when the options button is pressed.
    ///              If it is nil, there is no options button.
    /// - Returns: The new tab with the actions.
    public func standardActions<ContentView>(
        @ViewBuilder add: @escaping () -> ContentView,
        remove: @escaping (String?, Int?) -> Void,
        options: (() -> Void)? = nil
    ) -> Self where ContentView: View {
        actions {
            ToolbarGroup {
                ToolbarMenu(
                    "Add",
                    symbol: .init(systemName: "plus")
                ) { add() }
                ToolbarAction(
                    "Remove",
                    symbol: .init(systemName: "minus")
                ) {
                    let index = content.firstIndex { $0.id == SettingsModel.shared.selectedSubtabs[id] }
                    remove(content[safe: index]?.id, index)
                }
            }
            .spacer()
            if let options {
                ToolbarGroup {
                    ToolbarAction(
                        "Options",
                        symbol: .init(systemName: "ellipsis"),
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

    /// Set the content above the list of subtabs.
    /// - Parameter view: The content.
    /// - Returns: The settings tab.
    public func top<Top>(_ view: () -> Top) -> Self where Top: View {
        var newSelf = self
        newSelf.top = .init(view())
        return newSelf
    }

    /// Set the content below the list of subtabs.
    /// - Parameter view: The content.
    /// - Returns: The settings tab.
    public func bottom<Bottom>(_ view: () -> Bottom) -> Self where Bottom: View {
        var newSelf = self
        newSelf.bottom = .init(view())
        return newSelf
    }

    /// Enable or disable the automatic selection of settings tabs that are created.
    /// - Parameter enabled: Whether settings tabs that are created are automatically selected.
    /// - Returns: The settings tab.
    public func automaticSubtabSelection(_ enabled: Bool = true) -> Self {
        var newSelf = self
        newSelf.autoSelect = enabled
        return newSelf
    }

}

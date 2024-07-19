//
//  SettingsTab.swift
//  SettingsKit
//
//  Created by david-swift on 20.01.23.
//

import SwiftUI

/// A tab in the settings window.
public struct SettingsTab: Identifiable, View {

    /// The instance of the settings model.
    @ObservedObject var model = SettingsModel.shared
    /// The tab's identifier.
    public let id: String
    /// The tab's type.
    public var type: TabType
    /// The tab's color in the sidebar design.
    public var color: Color
    /// The tab's content.
    public var content: [SettingsSubtab]
    /// The view above the list of the subtabs in the sidebar style settings window.
    public var top: AnyView?
    /// The view below the list of the subtabs in the sidebar style settings window.
    public var bottom: AnyView?
    /// The sidebar actions view.
    public var sidebarActions: [ToolbarGroup]
    /// The settings window's width.
    public var windowWidth: CGFloat? = .settingsWidth
    /// The settings window's height.
    public var windowHeight: CGFloat? = .settingsHeight
    /// Whether a subtab is automatically selected after being created.
    public var autoSelect = true

    /// The tab's content, but without the subtabs with the ``TabType.noSelection`` type.
    var contentWithoutNoSelectionSubtabs: [SettingsSubtab] {
        content.filter { !$0.type.isNoSelection }
    }

    /// The view containing all the subtabs.
    public var body: some View {
        if content.count <= 1 && sidebarActions.isEmpty {
            content.first?
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
    var sidebar: some View {
        ZStack {
            Color(.textBackgroundColor)
            VStack {
                ZStack {
                    sidebarList
                    VStack {
                        Spacer()
                        Divider()
                    }
                }
                if !sidebarActions.isEmpty {
                    sidebarActions
                        .padding(.bottom, .actionsPadding)
                }
            }
        }
        .frame(height: .settingsHeight)
        .frame(minWidth: .settingsSidebarWidth)
    }

    /// The list in the tab's sidebar.
    var sidebarList: some View {
        contentView {
            if #available(macOS 13, *) {
                let notOptional = model.selectedSubtabs[id] ?? ""
                List(
                    contentWithoutNoSelectionSubtabs,
                    selection: .init {
                        notOptional
                    } set: { newValue in
                        model.selectedSubtabs[id] = newValue
                    }
                ) { subtab in
                    listContent(subtab: subtab)
                }
            } else {
                List(
                    contentWithoutNoSelectionSubtabs,
                    selection: .init {
                        model.selectedSubtabs[id]
                    } set: { newValue in
                        model.selectedSubtabs[id] = newValue
                    }
                ) { subtab in
                    listContent(subtab: subtab)
                }
            }
        }
    }

    /// The body if the sidebar layout is active.
    @available(macOS 13, *)
    @ViewBuilder var sidebarBody: some View {
        contentView {
            if content.count <= 1 && top == nil && bottom == nil { body } else {
                NavigationStack(path: .init { () -> [String] in
                    if content.contains(where: { $0.id == model.selectedSubtabs[id] }) {
                        return [model.selectedSubtabs[id] ?? ""]
                    }
                    return []
                } set: { newValue in
                    guard let first = newValue.first else {
                        return
                    }
                    model.selectedSubtabs[id] = first
                }) {
                    Form {
                        top
                        ForEach(content) { content in
                            if !content.type.isNoSelection {
                                NavigationLink(value: content.id) { content.sidebarLabel }
                            }
                        }
                        if !sidebarActions.isEmpty {
                            let bottomPadding = 5.0
                            sidebarActions.padding(.bottom, bottomPadding)
                        }
                        bottom
                    }
                    .formStyle(.grouped)
                    .navigationDestination(for: String.self) { content[id: $0]?.body.navigationSubtitle("Hi") }
                }
            }
        }
    }

    /// The selected subtab's content.
    var contentView: some View {
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
        guard case let .new(title: title, image: icon) = type else {
            return nil
        }
        return .init {
            Text(title)
        } icon: {
            icon
        }
    }

    /// The label in the sidebar.
    @ViewBuilder public var sidebarLabel: some View {
        if case let .new(title: title, image: icon) = type {
            HStack {
                icon
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

}

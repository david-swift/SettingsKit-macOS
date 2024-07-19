//
//  SettingsKitScene.swift
//  SettingsKit
//
//  Created by david-swift on 21.01.23.
//

import SwiftUI

/// A structure adding the settings to another scene.
struct SettingsKitScene<Content>: Scene where Content: Scene {

    /// The shared instance of the ``SettingsModel``.
    @StateObject private var model = SettingsModel.shared
    /// The scene the settings are added to.
    var content: Content
    /// The settings tabs.
    var settings: [SettingsTab]
    /// The identifier of the settings tab with the keyboard shortcut.
    var standardID: String
    /// Modify the way symbols are displayed.
    var symbolVariant: Any?
    /// The design of the settings window.
    var design: SettingsWindowDesign
    /// The preferred color scheme.
    var colorScheme: ColorScheme?
    /// The filter in the sidebar design.
    @State private var search = ""
    /// The binding controlling the selection.
    var selectedTab: Binding<String>?

    /// Get the symbol variants as symbol variants in macOS 12.
    @available(macOS 12, *)
    var unwrappedSymbolVariant: SymbolVariants? {
        symbolVariant as? SymbolVariants
    }

    /// The scene.
    var body: some Scene {
        Group {
            content
            Settings {
                let group = Group {
                    if #available(macOS 13, *), design == .sidebar {
                        navigationView
                    } else {
                        tabView
                    }
                }
                .onChange(of: selectedTab?.wrappedValue) { newValue in
                    if let newValue {
                        model.selectedTab = newValue
                    }
                }
                .onAppear {
                    model.selectedTab = selectedTab?.wrappedValue ?? ""
                }
                .onChange(of: model.selectedTab) { newValue in
                    selectedTab?.wrappedValue = newValue
                }
                .preferredColorScheme(colorScheme)
                group
            }
        }
    }

    /// The view with the sidebar design.
    @available(macOS 13, *)
    private var navigationView: some View {
        NavigationView {
            List(selection: .init { SettingsModel.shared.selectedTab } set: { model.selectedTab = $0 }) {
                Section {
                    ForEach(settings.filter { tab in
                        if case let .new(title: title, image: _) = tab.type {
                            let search = search.lowercased()
                            let contentContains = tab.content.contains { subtab in
                                if case let .new(title: title, image: _) = subtab.type {
                                    return title.lowercased().contains(search)
                                }
                                return false
                            }
                            return title.lowercased().contains(search) || search.isEmpty || contentContains
                        }
                        return false
                    }) { $0.sidebarLabel }
                }
            }
            let tab = settings.first { $0.id == SettingsModel.shared.selectedTab }
            tab?.sidebarBody
                .navigationTitle({ () -> String in
                    if case let .new(title: title, image: _) = tab?.type {
                        return title
                    } else {
                        return ""
                    }
                }())
                .formStyle(.grouped)
        }
        .searchable(text: $search, placement: .sidebar)
        .toolbar {
            Text("")
        }
        .task {
            let window = NSApplication.shared.keyWindow
            window?.toolbarStyle = .unified
            window?.toolbar?.displayMode = .iconOnly
        }
        .onAppear {
            if !settings.contains(where: { $0.id == model.selectedTab }), let id = settings.first?.id {
                model.selectedTab = id
            }
        }
    }

    /// The view with the tab design.
    private var tabView: some View {
        TabView(selection: .init { SettingsModel.shared.selectedTab } set: { newValue in
            model.selectedTab = newValue
        }) {
            ForEach(settings) { tab in
                if case .new = tab.type {
                    tab
                        .tabViewStyle(.automatic)
                        .tabItem {
                            tab.label
                        }
                }
            }
        }
        .onAppear {
            Task {
                let window = NSApplication.shared.keyWindow
                window?.toolbarStyle = .preference
                window?.toolbar?.displayMode = .iconAndLabel
            }
        }
        .onAppear {
            let selection = SettingsModel.shared.selectedTab
            model.selectedTab = ""
            model.selectedTab = selection
        }
    }

}

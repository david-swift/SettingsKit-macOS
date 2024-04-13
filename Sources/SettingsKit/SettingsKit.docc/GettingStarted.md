# Getting started

_SettingsKit_ is a SwiftUI library for adding a settings window to a macOS app. A settings window has got several _settings tabs_ which contain one or more _settings subtabs_. 

## Design overview

In the default macOS settings window design with a tab bar, the subtabs are displayed in a small sidebar. If there is only one subtab and there are no buttons in the sidebar, the sidebar is not visible.

![A settings window in the default design](DefaultDesign.png)

In the settings window design with a sidebar, the subtabs are listed in the main view. With a click on the subtab in the list, one can view the details of the subtab. If there is only one subtab and no buttons in the sidebar, the detail view of that subtab is directly the child of the tab.

![A settings window in the sidebar design](SidebarDesign.png)

## Installation
### Swift package
1. Open your Swift package in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Copy Dependency`.
5. Navigate to the `Package.swift` file.
6. In the `Package` initializer, under `dependencies`, paste the dependency into the array.

###  Xcode project
1. Open your Xcode project in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Add Package`.

## Development
SettingsKit is an open source project. Visit the [GitHub repository][1] for bug reports, feature requests, pull requests and more information.

[1]:	https://github.com/david-swift/SettingsKit-macOS

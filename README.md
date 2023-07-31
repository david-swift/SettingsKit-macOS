<p align="center">
  <img width="256" alt="SettingsKit Icon" src="Icons/SettingsKitIcon.png">
  <h1 align="center">SettingsKit</h1>
</p>

<p align="center">
  <a href="https://github.com/david-swift/SettingsKit-macOS">
  GitHub
  </a>
  ·
  <a href="Documentation/Reference/SettingsKit/README.md">
  Contributor Docs
  </a>
</p>

_SettingsKit_ makes it easier to add a settings window to a SwiftUI app for macOS.

![GitHub Banner][image-1]

## Table of Contents

- [Elements][1]
- [Installation][2]
- [Usage][3]
- [Thanks][4]

## Elements

| Name                        | Description                                                                                                                                  |
| --------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------- |
| Settings                    | A scene modifier for adding a settings window.                                                                                               |
| Settings Image Button Style | The button style of an image picker in the settings.                                                                                         |
| Settings Action             | Contains a function for showing the settings window manually and another function for getting the active settings tab and subtabs selection. |

## Installation

### Swift Package
1. Open your Swift package in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Copy Dependency`.
5. Navigate to the `Package.swift` file.
6. In the `Package` initializer, under `dependencies`, paste the dependency into the array.

###  Xcode Project
1. Open your Xcode project in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Add Package`.

## Usage

You can add settings to any SwiftUI scene, for example to a `Window` or `WindowGroup` in a standard SwiftUI app. 

The following example creates a simple settings window:
```swift
@main
struct SuperCoolApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .settings {
            // 1.1 - The "General" settings tab.
            SettingsTab(.init("General" as String, systemSymbol: .gearshape), id: "general-tab") {
                // 1.2 - The "General" > "Appearance" settings subtab.
                SettingsSubtab(.init("Appearance" as String, systemSymbol: .circleLefthalfFilled), id: "appearance") {
                    AppearanceSettings()
                }
                // 1.2 - The "General" > "Composer" settings subtab.
                SettingsSubtab(.init("Composer" as String, systemSymbol: .person), id: "composer") {
                    ComposerSettings()
                }
            }

            // 1.3 - An extension for the "General" settings tab.
            SettingsTab(.extend(id: "general-tab"), id: "general-tab-extension") {
                // 1.4 - The "General" settings subtab for no selection.
                SettingsSubtab(.noSelection, id: "no-selection") {
                    NoSelectionInformation()
                }
            }

            // 1.1 - The "Themes" settings tab.
            SettingsTab(.init("Themes" as String, systemSymbol: .paintbrush)) {
                for theme in themes {
                    // 1.2 - A "Themes" > "THEME_NAME" settings subtab for each theme.
                    SettingsSubtab(.init(theme.title, systemSymbol: .paintbrush), id: theme.id) {

                    }
                }
            }
            // 2.1 - The "+" and "-" buttons in the sidebar's toolbar.
            .standardActions {
                themes.append(.init())
            } remove: { index in
                if let index {
                    themes.remove(at: index)
                }
            }

        }
    }

}
```

- `1.1` - Create a new settings tab with the initializer for `SettingsTab` inside the `settings(_:)` modifier on a scene.
- `1.2` - Create a new settings subtab with the initializer for `SettingsSubtab` inside a `SettingsTab` initializer.
- `1.3` - Extend an existing tab by using `.extend(id:)` and providing the ID of the settings tab to extend.
- `1.4` - Create a new settings subtab by using `.noSelection` that is displayed if there is not a selected subtab.
- `2.1` - Use the `.standardActions(add:remove:options:)` modifier on a settings tab for adding a „+“, „-„ and optionally „⋯“ toolbar button to the sidebar. You can also add a custom toolbar with `.actions(content:)`. 

## Thanks

### Dependencies
- [SFSafeSymbols][5] licensed under the [MIT license][6]
- [SwiftLintPlugin][7] licensed under the [MIT license][8]
- [ColibriComponents][9] licensed under the [MIT license][10]

### Other Thanks
- The [contributors][11]
- [SourceDocs][12] used for generating the [docs][13]
- [SwiftLint][14] for checking whether code style conventions are violated
- The programming language [Swift][15]

[1]:	#Elements
[2]:	#Installation
[3]:	#Usage
[4]:	#Thanks
[5]:	https://github.com/SFSafeSymbols/SFSafeSymbols
[6]:	https://github.com/SFSafeSymbols/SFSafeSymbols/blob/stable/LICENSE
[7]:	https://github.com/lukepistrol/SwiftLintPlugin
[8]:	https://github.com/lukepistrol/SwiftLintPlugin/blob/main/LICENSE
[9]:	https://github.com/david-swift/ColibriComponents-macOS
[10]:	https://github.com/david-swift/ColibriComponents-macOS/blob/main/LICENSE.md
[11]:	Contributors.md
[12]:	https://github.com/SourceDocs/SourceDocs
[13]:	Documentation/Reference/SettingsKit-macOS/README.md
[14]:	https://github.com/realm/SwiftLint
[15]:	https://github.com/apple/swift

[image-1]:	Icons/GitHubBanner.png

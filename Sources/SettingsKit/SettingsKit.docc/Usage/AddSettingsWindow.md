# Add a settings window

Adding a settings window to your existing macOS app written in SwiftUI is very simple.

## Add a settings window
1. Add the following import to the file calling your app’s main scene (by default, it’s in the `[AppName]App.swift` file):
```swift
import SettingsKit
```
2. Add the ``SwiftUI/Scene/settings(design:symbolVariant:selectedTab:_:)`` modifier to your scene, in this example `WindowGroup`:
```swift
var body: some Scene {
    WindowGroup {
        ContentView()
    }
    .settings {
        SettingsTab(.new(title: "Test", icon: .app), id: "test") {
            SettingsSubtab(.noSelection, id: "no-selection") {
                Text("Test Tab")
            }
        }
    }
}
```
The content of the modifier adds a settings tab called “Test” which contains a single subtab with a simple SwiftUI view as the content.

## Choose a design
There are two designs available: the default macOS design and the sidebar design. You can switch to the sidebar design by replacing the line `settings {` with `settings(design: .sidebar) {`.

## Change the appearance of icons
With the `symbolVariant` parameter, it’s possible to change the look of the icons. When using the sidebar design, the icons are always filled.

## Observe and change the selected tab
Pass a binding to the `selectedTab` parameter that will sync with the selected tab. Changes you make to the binding will affect the selected tab, and changes the user makes via the UI will change your binding.

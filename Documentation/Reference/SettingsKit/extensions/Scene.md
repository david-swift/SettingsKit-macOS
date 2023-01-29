**EXTENSION**

# `Scene`
```swift
extension Scene
```

## Methods
### `settings(_:)`

```swift
public func settings(@ArrayBuilder<SettingsTab> _ settings: () -> [SettingsTab]) -> some Scene
```

Adds the settings to a scene.
- Parameter _: The settings tabs of the settings window.
- Returns: The scene with the settings.

Use it as a modifier for a scene:
```swift
WindowGroup {
    ContentView()
}
.settings {
    SettingsTab(.init("General", systemSymbol: .gearshape), id: "general-tab") {
        GeneralTabContent()
    }
}
```

#### Parameters

| Name | Description |
| ---- | ----------- |
| _ | The settings tabs of the settings window. |

### `getSettings(_:)`

```swift
private func getSettings(_ settings: [SettingsTab]) -> ([SettingsTab], String)
```

Converts the settings to an array containing only the valid settings.
- Parameter settings: The settings in the form defined by the coder.
- Returns: The settings in the settings form and a string with the identifier of the standard tab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| settings | The settings in the form defined by the coder. |
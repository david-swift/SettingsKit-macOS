**ENUM**

# `SettingsAction`

```swift
public enum SettingsAction
```

Actions for interacting with SettingsKit.

## Properties
### `settingsModel`

```swift
static var settingsModel: SettingsModel
```

The shared instance of the settings model.

## Methods
### `showSettings(tab:subtab:)`

```swift
public static func showSettings(tab: String? = nil, subtab: String? = nil)
```

Show the settings window.
- Parameters:
  - tab: The identifier of the new tab selection.
  - subtab: The identifier of the new subtab selection.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tab | The identifier of the new tab selection. |
| subtab | The identifier of the new subtab selection. |

### `getSelection()`

```swift
public static func getSelection() -> (String, [String: String])
```

Get the selected tab and subtab selection.
- Returns: The selected tab and the selected subtabs of all the tabs.

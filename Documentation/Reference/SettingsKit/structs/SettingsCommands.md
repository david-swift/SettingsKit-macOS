**STRUCT**

# `SettingsCommands`

```swift
struct SettingsCommands: Commands
```

The settings commands for the menu bar.
It adds a menu containing all the settings tabs as other menus or buttons.
Settingstabs that are menus contain the subtabs as buttons.

## Properties
### `model`

```swift
@StateObject private var model = SettingsModel.shared
```

The shared instance of the ``SettingsModel``.

### `settings`

```swift
var settings: [SettingsTab]
```

The settings tabs.

### `shortcutsID`

```swift
var shortcutsID: String
```

The identifier of the subtab with the shortcut.

### `body`

```swift
var body: some Commands
```

The commands.

## Methods
### `settingsTab(_:shortcutsID:)`

```swift
@ViewBuilder private func settingsTab(_ tab: SettingsTab, shortcutsID: String) -> some View
```

Get the view for a settings tab in the commands.
- Parameters:
  - tab: The settings tab.
  - shortcutsID: The identifier of the settings button with the shortcut.
- Returns: A view for the settings tab in the commands.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tab | The settings tab. |
| shortcutsID | The identifier of the settings button with the shortcut. |

### `tabButton(_:label:)`

```swift
private func tabButton(_ tab: SettingsTab, label: Label<Text, Image>) -> some View
```

Get the commands button for a settings tab with only one subtab.
- Parameters:
  - tab: The settings tab.
  - label: The settings tab's label.
- Returns: A view containing the button for the settings tab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| tab | The settings tab. |
| label | The settings tab’s label. |

### `settingsSubtab(_:tab:)`

```swift
@ViewBuilder private func settingsSubtab(_ subtab: SettingsSubtab, tab: SettingsTab) -> some View
```

Get the commands button for a settings subtab.
- Parameters:
  - subtab: The settings subtab.
  - tab: The settings tab of the subtab.
- Returns: A view containing the button for the settings subtab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| subtab | The settings subtab. |
| tab | The settings tab of the subtab. |
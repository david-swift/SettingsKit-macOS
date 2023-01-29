**STRUCT**

# `SettingsTab`

```swift
public struct SettingsTab: Identifiable, View
```

A tab in the settings window.

## Properties
### `model`

```swift
@StateObject private var model = SettingsModel.shared
```

The instance of the settings model.

### `id`

```swift
public let id: String
```

The tab's identifier.

### `type`

```swift
public var type: TabType
```

The tab's type.

### `content`

```swift
public var content: [SettingsSubtab]
```

The tab's content.

### `sidebarActions`

```swift
public var sidebarActions: [ToolbarGroup]
```

The sidebar actions view.

### `body`

```swift
public var body: some View
```

The view containing all the subtabs.

### `sidebar`

```swift
private var sidebar: some View
```

The tab's sidebar containing all the subtabs.

### `sidebarList`

```swift
private var sidebarList: some View
```

The list in the tab's sidebar.

### `contentView`

```swift
private var contentView: some View
```

The selected subtab's content.

## Methods
### `init(_:id:content:)`

```swift
public init(
    _ type: TabType,
    id: String,
    @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
)
```

The initializer.
- Parameters:
  - type: The tab type of the settings tab.
  - id: The identifier.
  - content: The content of the settings tab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | The tab type of the settings tab. |
| id | The identifier. |
| content | The content of the settings tab. |

### `init(_:id:content:)`

```swift
public init(
    _ label: Label<Text, Image>,
    id: String,
    @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
)
```

An initializer for a custom settings tav.
- Parameters:
  - label: The label of the custom settings tab.
  - id: The identifier.
  - content: The content of the custom settings tab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The label of the custom settings tab. |
| id | The identifier. |
| content | The content of the custom settings tab. |

### `shortcut()`

```swift
public func shortcut() -> Self
```

Adds the settings shortcut to the first subtab.
- Returns: The new tab with the shortcut.

### `actions(content:)`

```swift
public func actions(@ArrayBuilder<ToolbarGroup> content: () -> [ToolbarGroup]) -> Self
```

Adds actions to the settings sidebar.
- Parameter content: The actions.
- Returns: The new tab with the actions.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The actions. |

### `actions(content:)`

```swift
public func actions(content: [ToolbarGroup]) -> Self
```

Add actions to the settings sidebar by providing an array.
- Parameter content: The actions as an array..
- Returns: The new tab with the actions.

#### Parameters

| Name | Description |
| ---- | ----------- |
| content | The actions as an array.. |

### `standardActions(add:remove:options:)`

```swift
public func standardActions(
    add: @escaping () -> Void,
    remove: @escaping (Int?) -> Void,
    options: (() -> Void)? = nil
) -> Self
```

The standard set of actions with an add button, a remove button and optionally an options button.
- Parameters:
  - add: The action that is called when the add button is pressed.
  - remove: The action that is called when the remove button is pressed, giving the the selected subtab's index.
  - options: The action that is called when the options button is pressed.
             If it is nil, there is no options button.
- Returns: The new tab with the actions.

#### Parameters

| Name | Description |
| ---- | ----------- |
| add | The action that is called when the add button is pressed. |
| remove | The action that is called when the remove button is pressed, giving the the selected subtab’s index. |
| options | The action that is called when the options button is pressed. If it is nil, there is no options button. |
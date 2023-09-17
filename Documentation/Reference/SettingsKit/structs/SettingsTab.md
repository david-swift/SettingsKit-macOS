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

### `color`

```swift
public var color: Color
```

The tab's color in the sidebar design.

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

### `windowWidth`

```swift
public var windowWidth: CGFloat? = .settingsWidth
```

The settings window's width.

### `windowHeight`

```swift
public var windowHeight: CGFloat? = .settingsHeight
```

The settings window's height.

### `contentWithoutNoSelectionSubtabs`

```swift
private var contentWithoutNoSelectionSubtabs: [SettingsSubtab]
```

The tab's content, but without the subtabs with the ``TabType.noSelection`` type.

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

### `sidebarBody`

```swift
@ViewBuilder var sidebarBody: some View
```

The body if the sidebar layout is active.

### `contentView`

```swift
private var contentView: some View
```

The selected subtab's content.

### `label`

```swift
public var label: Label<Text, Image>?
```

The label of a custom tab, or else nil.

### `sidebarLabel`

```swift
@ViewBuilder public var sidebarLabel: some View
```

The label in the sidebar.

## Methods
### `init(_:id:color:content:)`

```swift
public init(
    _ type: TabType,
    id: String,
    color: Color = .blue,
    @ArrayBuilder<SettingsSubtab> content: () -> [SettingsSubtab]
)
```

The initializer.
- Parameters:
  - type: The tab type of the settings tab.
  - id: The identifier.
  - color: The tab's color in the settings window with the sidebar design.
  - content: The content of the settings tab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | The tab type of the settings tab. |
| id | The identifier. |
| color | The tab’s color in the settings window with the sidebar design. |
| content | The content of the settings tab. |

### `listContent(subtab:)`

```swift
private func listContent(subtab: SettingsSubtab) -> some View
```

A row in the sidebar list.
- Parameter subtab: The subtab of the row.
- Returns: The row.

#### Parameters

| Name | Description |
| ---- | ----------- |
| subtab | The subtab of the row. |

### `updateSubtabSelection(ids:)`

```swift
private func updateSubtabSelection(ids: [String])
```

Update the selection of the subtab.
- Parameter ids: The identifiers of the subtabs.

#### Parameters

| Name | Description |
| ---- | ----------- |
| ids | The identifiers of the subtabs. |

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

### `standardActions(add:remove:options:)`

```swift
public func standardActions<ContentView>(
    @ViewBuilder add: @escaping () -> ContentView,
    remove: @escaping (Int?) -> Void,
    options: (() -> Void)? = nil
) -> Self where ContentView: View
```

The standard set of actions with an add menu, a remove button and optionally an options button.
- Parameters:
  - add: The menu that is opened when the add button is pressed.
  - remove: The action that is called when the remove button is pressed, giving the the selected subtab's index.
  - options: The action that is called when the options button is pressed.
             If it is nil, there is no options button.
- Returns: The new tab with the actions.

#### Parameters

| Name | Description |
| ---- | ----------- |
| add | The menu that is opened when the add button is pressed. |
| remove | The action that is called when the remove button is pressed, giving the the selected subtab’s index. |
| options | The action that is called when the options button is pressed. If it is nil, there is no options button. |

### `frame(width:height:)`

```swift
public func frame(width: CGFloat? = nil, height: CGFloat? = nil) -> Self
```

Set the window's width and height when this tab is open.
This is being ignored if there is more than one subtab or if there are settings actions.
- Parameters:
  - width: The width. If nil, the window uses the content's width.
  - height: The height. If nil, the window uses the content's height.
- Returns: The settings tab with the new window size.

#### Parameters

| Name | Description |
| ---- | ----------- |
| width | The width. If nil, the window uses the content’s width. |
| height | The height. If nil, the window uses the content’s height. |

### `width(_:)`

```swift
public func width(_ width: CGFloat? = nil) -> Self
```

Set the window's width when this tab is open without affecting the height.
This is being ignored if there is more than one subtab or if there are settings actions.
- Parameter width: The width. If nil, the window uses the content's width.
- Returns: The settings tab with the new window size.

#### Parameters

| Name | Description |
| ---- | ----------- |
| width | The width. If nil, the window uses the content’s width. |

### `height(_:)`

```swift
public func height(_ height: CGFloat? = nil) -> Self
```

Set the window's height when this tab is open without affecting the width.
This is being ignored if there is more than one subtab or if there are settings actions.
- Parameter height: The height. If nil, the window uses the content's height.
- Returns: The settings tab with the new window size.

#### Parameters

| Name | Description |
| ---- | ----------- |
| height | The height. If nil, the window uses the content’s height. |
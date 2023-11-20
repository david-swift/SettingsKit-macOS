**STRUCT**

# `SettingsTab`

```swift
public struct SettingsTab: Identifiable, View
```

A tab in the settings window.

## Properties
### `model`

```swift
@ObservedObject var model = SettingsModel.shared
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

### `top`

```swift
public var top: AnyView?
```

The view above the list of the subtabs in the sidebar style settings window.

### `bottom`

```swift
public var bottom: AnyView?
```

The view below the list of the subtabs in the sidebar style settings window.

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

### `autoSelect`

```swift
public var autoSelect = true
```

Whether a subtab is automatically selected after being created.

### `contentWithoutNoSelectionSubtabs`

```swift
var contentWithoutNoSelectionSubtabs: [SettingsSubtab]
```

The tab's content, but without the subtabs with the ``TabType.noSelection`` type.

### `body`

```swift
public var body: some View
```

The view containing all the subtabs.

### `sidebar`

```swift
var sidebar: some View
```

The tab's sidebar containing all the subtabs.

### `sidebarList`

```swift
var sidebarList: some View
```

The list in the tab's sidebar.

### `sidebarBody`

```swift
@ViewBuilder var sidebarBody: some View
```

The body if the sidebar layout is active.

### `contentView`

```swift
var contentView: some View
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
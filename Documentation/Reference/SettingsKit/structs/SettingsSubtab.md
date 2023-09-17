**STRUCT**

# `SettingsSubtab`

```swift
public struct SettingsSubtab: Identifiable, View
```

A tab in a settings tab.

## Properties
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
public var content: any View
```

The tab's view.

### `color`

```swift
public var color: Color
```

The tab's color.

### `standard`

```swift
var standard = false
```

Whether the subtab is the standard tab.

### `body`

```swift
public var body: some View
```

The view's body.
It is an AnyView wrapped around the ``content``.

### `label`

```swift
public var label: Label<Text, Image>?
```

The label of a custom tab, or else nil.

### `sidebarLabel`

```swift
@ViewBuilder public var sidebarLabel: some View
```

The label for the sidebar style.

## Methods
### `init(_:id:color:content:)`

```swift
public init(_ type: TabType, id: String, color: Color = .blue, @ViewBuilder content: () -> any View)
```

The initializer.
- Parameters:
  - type: The tab type of the settings subtab.
  - id: The identifier.
  - color: The tab's color in the sidebar style.
  - content: The content of the settings subtab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | The tab type of the settings subtab. |
| id | The identifier. |
| color | The tab’s color in the sidebar style. |
| content | The content of the settings subtab. |
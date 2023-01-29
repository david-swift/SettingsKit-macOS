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

## Methods
### `init(_:id:content:)`

```swift
public init(_ type: TabType, id: String, @ViewBuilder content: () -> any View)
```

The initializer.
- Parameters:
  - type: The tab type of the settings subtab.
  - id: The identifier.
  - content: The content of the settings subtab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| type | The tab type of the settings subtab. |
| id | The identifier. |
| content | The content of the settings subtab. |

### `init(_:id:content:)`

```swift
public init(_ label: Label<Text, Image>, id: String, @ViewBuilder content: () -> any View)
```

An initializer for a custom settings subtab.
- Parameters:
  - label: The label of the custom settings subtab.
  - id: The identifier.
  - content: The content of the custom settings subtab.

#### Parameters

| Name | Description |
| ---- | ----------- |
| label | The label of the custom settings subtab. |
| id | The identifier. |
| content | The content of the custom settings subtab. |

### `shortcut()`

```swift
public func shortcut() -> Self
```

Adds the settings shortcut to the subtab and returns the new one.
- Returns: The new subtab with the shortcut.

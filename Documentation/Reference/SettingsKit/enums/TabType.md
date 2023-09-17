**ENUM**

# `TabType`

```swift
public enum TabType
```

The type of a settings tab or subtab.

## Cases
### `new(title:icon:)`

```swift
case new(title: String, icon: SFSymbol)
```

A new settings tab or subtab with a label.

### `extend(id:)`

```swift
case extend(id: String)
```

An extension for an existing settings tab or subtab.

### `noSelection`

```swift
case noSelection
```

A settings subtab that is selected if nothing else is selected, or a hidden settings tab.

## Properties
### `isNoSelection`

```swift
var isNoSelection: Bool
```

Whether the tab type is ``noSelection``.

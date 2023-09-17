**STRUCT**

# `SettingsKitScene`

```swift
struct SettingsKitScene<Content>: Scene where Content: Scene
```

A structure adding the settings to another scene.

## Properties
### `model`

```swift
@StateObject private var model = SettingsModel.shared
```

The shared instance of the ``SettingsModel``.

### `content`

```swift
var content: Content
```

The scene the settings are added to.

### `settings`

```swift
var settings: [SettingsTab]
```

The settings tabs.

### `standardID`

```swift
var standardID: String
```

The identifier of the settings tab with the keyboard shortcut.

### `symbolVariant`

```swift
var symbolVariant: SymbolVariants
```

Modify the way symbols are displayed.

### `design`

```swift
var design: SettingsWindowDesign
```

The design of the settings window.

### `search`

```swift
@State private var search = ""
```

The filter in the sidebar design.

### `body`

```swift
var body: some Scene
```

The scene.

### `navigationView`

```swift
private var navigationView: some View
```

The view with the sidebar design.

### `tabView`

```swift
private var tabView: some View
```

The view with the tab design.

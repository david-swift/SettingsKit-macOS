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

### `body`

```swift
var body: some Scene
```

The scene.

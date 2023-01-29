**CLASS**

# `SettingsModel`

```swift
final class SettingsModel: ObservableObject
```

A class containing all the information about the settings window state.

## Properties
### `shared`

```swift
static var shared = SettingsModel()
```

A shared instance of the ``SettingsModel``.

### `selectedTab`

```swift
@Published var selectedTab: String
```

The identifier of the selected tab.

### `selectedSubtabs`

```swift
@Published var selectedSubtabs: [String: String]
```

The identifiers of the selected subtabs.

## Methods
### `init()`

```swift
init()
```

The initializer. It fetches the stored user defaults.

**STRUCT**

# `SettingsImageButtonStyle`

```swift
public struct SettingsImageButtonStyle: ButtonStyle
```

The button style of an image picker in the settings.
If the button is not the selected picker element, there is a white overlay.

## Properties
### `selected`

```swift
var selected: Bool
```

Whether the button is the selected picker element.

## Methods
### `makeBody(configuration:)`

```swift
public func makeBody(configuration: Configuration) -> some View
```

Build the image picker button style.
- Parameter configuration: The button's configuration.
- Returns: A view containing the button.

#### Parameters

| Name | Description |
| ---- | ----------- |
| configuration | The button’s configuration. |
# The Sidebar Design

It’s possible to activate a design with a sidebar for navigation using `settings(design: .sidebar) { }` instead of `.settings { }`. There are some modifiers that only have an effect when using the sidebar design.

## Add Views Above or Below the List of Subtabs
When using the sidebar design, it's possible to add views above the list of subtabs using the `top(_:)` or below the list using the `bottom(_:)` modifier on the settings tab:
```swift
SettingsTab(.new(title: "Accounts", icon: .at), id: "accounts") {
    // Subtabs
}
.top {
    // View
}
```

## Toolbar Items
Adding toolbar items to the content view of a subtab with the default macOS design results in buggy behavior. This isn't the case for the sidebar design. It is possible to use toolbars for e.g. modifying or deleting items (an example can be found in the sample app under the "Accounts" tab when activating the sidebar design).

## Disable the Automatic Selection of Subtabs
Disable the automatic selection of subtabs with the following syntax:
```swift
SettingsTab(.new(title: "Accounts", icon: .at), id: "accounts") {
    // Subtabs
}
.automaticSubtabSelection(false)
```

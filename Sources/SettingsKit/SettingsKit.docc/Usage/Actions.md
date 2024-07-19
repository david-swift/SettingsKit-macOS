# Actions

Actions are buttons, menus and other views below the list of subtabs. They “belong” to the subtabs which means that those actions should affect the subtabs. An important difference between the default and sidebar design is that in the default design, the actions are visible while a subtab is selected, which isn’t the case with the sidebar design.

## Create custom actions
1. Add the actions modifier to your settings tab:
```swift
SettingsTab(.new(title: "Accounts", icon: .at), id: "accounts") {
    // Subtabs
}
.actions {
    // Actions
}
```
2. Actions are grouped into toolbar groups. Toolbar groups are visually separated from the other groups. They can contain toolbar elements and custom views:
```swift
ToolbarGroup {
    // Toolbar Elements
} body: {
    // Custom Views
}
```
3. You should use toolbar elements instead of custom views wherever possible. There are two types of toolbar elements:
- ``ToolbarAction`` results in a button
- ``ToolbarMenu`` is a menu

## Standard actions
For the most common case with a “+” button or menu, “-“ button and optionally an ellipsis button, there are modifiers available (``SettingsTab/standardActions(add:remove:options:)-57w0k``) that directly add those to a settings tab.

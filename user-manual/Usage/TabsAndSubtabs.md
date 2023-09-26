# Tabs & Subtabs

The settings modifier expects a list of settings tabs as its content. Settings tabs enable a top-level navigation to different settings topics. If another layer of navigation is required, for example when having a list of multiple accounts, one can use subtabs. Later, we’ll see how it is possible to add buttons for e.g. adding a new account to the list of subtabs.

## Tabs
The settings tab initializer accepts three to four parameters.
- Tab type: Either `.new(title:icon:)` with the tab’s title and icon for creating a new tab (almost always used), or `.extend(id:)` in rare cases where you want to add subtabs to an already existing tab. Tabs with the type `.noSelection` are not rendered.
- ID: A string that differs from the IDs of all of the other tabs.
- Color (optional): This parameter only has an effect when using the sidebar settings style. It sets the background color of the icon in the sidebar.
- Content: The subtabs in that tab.
As an example, the code for a “General” tab could look like this:
```swift
SettingsTab(.new(title: "General", icon: .gearshape), id: "general", color: .gray) {
    SettingsSubtab(.noSelection, id: "no-selection") {
        Text("General Settings")
    }
}
```
The closure of the settings body supports many DSL features, such as `if`/`else` closures, `for` loops, etc.

### Change the Width or Height of a Settings Tab
Normally, _SettingsKit_ uses a fixed width and height. That is not always desired. Find more information [here][1] on how to change that.

## Subtabs
The settings subtab initializer accepts the same parameters as the settings tab initializer, but there are some differences:
- Tab type: `.new(title:icon:)`, `.extend(id:)` or `.noSelection`. `.noSelection` means that this subtab is selected if no other subtab is available. It is not visible in the list of subtabs.
- ID: A string that differs from the IDs of all of the other subtabs.
- Color (optional): This parameter only has an effect when using the sidebar settings style. It sets the background color of the icon in the subtabs list.
- Content: A SwiftUI view which is displayed when this subtab is selected. In many cases, it might make sense to use SwiftUI’s `Form` structure inside of subtabs. When using the sidebar style, the grouped form style is set if you do not overwrite it.
The closure of the settings tab supports many DSL features, mainly `for` loops might be important in some cases, e.g. a list of accounts where the user can add or remove items.
The example with the accounts might look similar to that:
```swift
SettingsTab(.new(title: "Accounts", icon: .at), id: "accounts") {
    for account in accounts {
        SettingsSubtab(.new(title: account.title, icon: .person), id: account.id) {
            AccountView(account)
        }
    }
}
```

One important feature is missing in the example above: Adding and removing accounts. This is the topic of the next section.

[1]:	https://github.com/david-swift/SettingsKit-macOS/issues/2#issuecomment-1627618096
<p align="center">
  <img width="256" alt="SettingsKit Icon" src="Icons/SettingsKitIcon.png">
  <h1 align="center">SettingsKit</h1>
</p>

<p align="center">
  <a href="https://david-swift.gitbook.io/settingskit/">
  User Manual
  </a>
  ·
  <a href="https://github.com/david-swift/SettingsKit-macOS">
  GitHub
  </a>
  ·
  <a href="Documentation/Reference/SettingsKit/README.md">
  Contributor Docs
  </a>
</p>

_SettingsKit_ makes it easier to add a settings window to a SwiftUI app for macOS.

![GitHub Banner][image-1]

## Table of Contents

- [Installation][1]
- [Usage][2]
- [Thanks][3]

## Installation

### Swift Package
1. Open your Swift package in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Copy Dependency`.
5. Navigate to the `Package.swift` file.
6. In the `Package` initializer, under `dependencies`, paste the dependency into the array.

###  Xcode Project
1. Open your Xcode project in Xcode.
2. Navigate to `File > Add Packages`.
3. Paste this URL into the search field: `https://github.com/david-swift/SettingsKit-macOS`
4. Click on `Add Package`.

## Usage

An example app project is available [here.][4]

* [Getting Started][5]

### Usage

* [Add a Settings Window][6]
* [Tabs & Subtabs][7]
* [Actions][8]  
* [The Sidebar Design][9]

## Thanks

### Dependencies
- [SFSafeSymbols][10] licensed under the [MIT license][11]
- [SwiftLintPlugin][12] licensed under the [MIT license][13]
- [ColibriComponents][14] licensed under the [MIT license][15]

### Other Thanks
- The [contributors][16]
- [SourceDocs][17] used for generating the [docs][18]
- [SwiftLint][19] for checking whether code style conventions are violated
- The programming language [Swift][20]

[1]:	#installation
[2]:	#usage
[3]:	#thanks
[4]:	/Tests/Examples/
[5]:	user-manual/GettingStarted.md
[6]:	user-manual/Usage/AddSettingsWindow.md
[7]:	user-manual/Usage/TabsAndSubtabs.md
[8]:	user-manual/Usage/Actions.md
[9]:	user-manual/Usage/SidebarDesign.md
[10]:	https://github.com/SFSafeSymbols/SFSafeSymbols
[11]:	https://github.com/SFSafeSymbols/SFSafeSymbols/blob/stable/LICENSE
[12]:	https://github.com/lukepistrol/SwiftLintPlugin
[13]:	https://github.com/lukepistrol/SwiftLintPlugin/blob/main/LICENSE
[14]:	https://github.com/david-swift/ColibriComponents-macOS
[15]:	https://github.com/david-swift/ColibriComponents-macOS/blob/main/LICENSE.md
[16]:	Contributors.md
[17]:	https://github.com/SourceDocs/SourceDocs
[18]:	Documentation/Reference/SettingsKit-macOS/README.md
[19]:	https://github.com/realm/SwiftLint
[20]:	https://github.com/apple/swift

[image-1]:	Icons/GitHubBanner.png
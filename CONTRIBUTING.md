# Contributing

Thank you very much for taking the time for contributing to this project. 

## Report a Bug
Just open a new issue on GitHub and describe the bug. It helps if your description is detailed. Thank you very much for your contribution!

## Suggest a New Feature
Just open a new issue on GitHub and describe the idea. Thank you very much for your contribution!

## Pull Requests
I am happy for every pull request, you do not have to follow these guidelines. However, it might help you to understand the project structure and make it easier for me to merge your pull request. Thank you very much for your contribution!

### 1. Fork & Clone this Project
Start by clicking on the `Fork` button at the top of the page. Then, clone this repository to your computer. 

### 2. Open the Project
If there is a top-level `(PROJECT_NAME).xcodeproj` file in the directory, open this file in Xcode (or AppCode). Else, open the `Package.swift` file.

### 3. Understand the Project Structure
You will find some top-level files and directories in both app (`(PROJECT_NAME).xcodeproj`) and package (`Package.swift`) projects:
- The `README.md` file contains a description of the app or package.
- The `Contributors.md` file contains the names or user names of all the contributors with a link to their GitHub profile.
- The `LICENSE.md` contains an MIT license.
- `CONTRIBUTING.md` is this file.
- Directory `Icons` that contains PNG and PXD (Pixelmator Pro) files for the images used in the app and guides.
- Directory `Documentation` that contains the documentation generated with [SourceDocs][1].

#### Package Project
In a package project, you will find those directories that contain the Swift code:
- `Sources` contains the source code of the project.
	- `(PROJECT_NAME)` contains the source code of the project.
		- `ViewModel` contains classes that store information for a part of the project and files related to them.
		- `View` contains structures that conform to the SwiftUI `View` protocol and whose main function it is to present content in a view. All of the files here have an additional structure add the bottom of the file that helps preview the views in Xcode.
		- `Components` contains structures whose main function is to present content but do not conform to the SwiftUI `View` protocol. 
		- `Model` is the directory for other content.
			- `Data` contains mainly structures and enumerations that represent a part of the app data, for example, a structure that is used by a view model.
			- `Extensions` contains all the extensions of types that are not defined in this project.
				- `SwiftUI` contains extensions to SwiftUI types.
			- `Protocols` contains all the protocols.
			- `View` contains data that defines how the content is presented and nothing else.
- `Tests` contains code written in Swift for testing the project.
	- `(PROJECT_NAME)Tests` contains single Swift files for testing the source code or sometimes even entire Xcode projects.

#### App Project
In an app project, you will find those directories and files:
- `(PROJECT_NAME)` contains the source code.
	- `(PROJECT_NAME)App.swift` contains the structure that conforms to the `App` protocol and is the entry point of the app.
	- `ViewModel` contains classes that store information for a part of the project and files related to them.
		- `AppModel.swift` contains a class that stores information for the whole app.
		- `ViewModel.swift` contains a class that stores information for one window of the app.
	- `View` contains structures that conform to the SwiftUI `View` protocol and whose main function it is to present content in a view. All of the files here have an additional structure add the bottom of the file that helps preview the views in Xcode.
		- `ContentView.swift` contains the main view for the main window.
	- `Components` contains structures whose main function is to present content but do not conform to the SwiftUI `View` protocol. 
	- `Model` is the directory for other content.
		- `Data` contains mainly structures and enumerations that represent a part of the app data, for example, a structure that is used by a view model.
		- `Extensions` contains all the extensions of types that are not defined in this project.
			- `SwiftUI` contains extensions to SwiftUI types.
		- `Protocols` contains all the protocols.
		- `View` contains data that defines how the content is presented and nothing else.
	- `Assets.xcassets` contains the assets for the app.
- `SUMMARY.md` is the table of contents for the user documentation.
- `user-manual` contains the user documentation.

### 4. Edit the Code or Docs
Edit the code. Build the code at least once to get warnings for violating the code style. If you add a new type, add documentation in the code.
You can also edit the docs’ text or add images. 

### 5. Commit to the Fork
Commit and push the fork.

### 6. Pull Request
Open GitHub to submit a pull request. Thank you very much for your contribution!

[1]:	https://github.com/SourceDocs/SourceDocs

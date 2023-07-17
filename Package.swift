// swift-tools-version: 5.7
//
//  Package.swift
//  SettingsKit
//
//  Created by david-swift on 19.01.23.
//

import PackageDescription

/// The SettingsKit package.
let package = Package(
    name: "SettingsKit",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "SettingsKit",
            targets: ["SettingsKit"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lukepistrol/SwiftLintPlugin", from: "0.2.2"),
        .package(url: "https://github.com/david-swift/ColibriComponents-macOS", from: "0.1.9")
    ],
    targets: [
        .target(
            name: "SettingsKit",
            dependencies: [
                .product(name: "ColibriComponents", package: "ColibriComponents-macOS")
            ],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        ),
        .testTarget(
            name: "SettingsKitTests",
            dependencies: ["SettingsKit"],
            plugins: [
                .plugin(name: "SwiftLint", package: "SwiftLintPlugin")
            ]
        )
    ]
)

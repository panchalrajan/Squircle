// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Squircle",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Squircle",
            targets: ["Squircle"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Squircle",
            dependencies: []),
    ]
)

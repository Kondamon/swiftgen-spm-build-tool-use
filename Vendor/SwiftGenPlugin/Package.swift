// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGenPlugin",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .plugin(
            name: "SwiftGenPlugin",
            targets: ["SwiftGenPlugin"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/SwiftGen/SwiftGen.git", from: "6.5.1")
    ],
    targets: [
        .plugin(
            name: "SwiftGenPlugin",
            capability: .buildTool(),
            dependencies: [
                .product(name: "swiftgen", package: "SwiftGen"),
            ]
        )
    ]
)

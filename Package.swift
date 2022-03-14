// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "LibraryRequiringCodegen",
    platforms: [
        .macOS(.v12)
    ],
    dependencies: [
        .package(path: "Vendor/SwiftGen"),
    ],
    targets: [
        .target(
            name: "LibraryRequiringCodegen",
            resources: [
                .copy("Media.xcassets/icon_256x256.imageset/icon_256x256.png"),
                .copy("Media.xcassets/icon_256x256.imageset/icon_256x256@2x.png"),
                .copy("Media.xcassets/icon_512x512.imageset/icon_512x512.png"),
                .copy("Media.xcassets/icon_512x512.imageset/icon_512x512@2x.png"),
                .copy("Media.xcassets")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGen")
            ]
        )
    ]
)

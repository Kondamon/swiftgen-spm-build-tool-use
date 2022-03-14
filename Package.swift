// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "LibraryRequiringCodegen",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LibraryRequiringCodegenLib",
            targets: ["LibraryRequiringCodegen"]
        )
    ],
    dependencies: [
        .package(name: "SwiftGen", path: "Vendor/SwiftGen"),
    ],
    targets: [
        .target(
            name: "LibraryRequiringCodegen",
            dependencies: [
                .product(name: "swiftgen", package: "SwiftGen")
            ],
            resources: [
                .copy("Media.xcassets/icon_256x256.imageset/icon_256x256.png"),
                .copy("Media.xcassets/icon_256x256.imageset/icon_256x256@2x.png"),
                .copy("Media.xcassets/icon_512x512.imageset/icon_512x512.png"),
                .copy("Media.xcassets/icon_512x512.imageset/icon_512x512@2x.png")
            ],
            plugins: [
                .plugin(name: "SwiftGenPlugin", package: "SwiftGen")
            ]
        )
    ]
)

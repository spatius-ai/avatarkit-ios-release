// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AvatarKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "AvatarKit", targets: ["AvatarKit"])
    ],
    targets: [
        .binaryTarget(
            name: "AvatarKit",
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.6/AvatarKit_202610021749.zip",
            checksum: "f41402276de0a72e14a2bd0a6d07fe67a2166d2af12622261f20dd3020c90ce6"
        )
    ]
)

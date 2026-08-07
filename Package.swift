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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.2/AvatarKit_202608072023.zip",
            checksum: "cf0a2a3166f7648a038a864f08c72837f1b84d5c06bcdd7adf338d55d56b3a0e"
        )
    ]
)

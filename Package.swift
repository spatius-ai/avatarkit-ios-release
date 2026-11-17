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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.9/AvatarKit-1.3.9.zip",
            checksum: "18b050821fca68db09bdfc7fd639ebd4aec25c45f168993683c63e7ff757c97a"
        )
    ]
)

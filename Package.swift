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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.1-beta.2/AvatarKit_202608060333.zip",
            checksum: "d55db28b794f41300e26435a8a1a6eb7c00827764c64d51e3e54a1b6dd6167f8"
        )
    ]
)

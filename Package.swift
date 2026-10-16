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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.7-beta.2/AvatarKit_202610170315.zip",
            checksum: "d306bd0f463753a960b2b85daf88260b9bfa141a03e1d115dec2f8dfe56af54b"
        )
    ]
)

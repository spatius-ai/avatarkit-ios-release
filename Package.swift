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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.7/AvatarKit_202611040359.zip",
            checksum: "026c46b9501ad476b01989b5e07742637c49699e1f9038ae7d57c8a39a2ef035"
        )
    ]
)

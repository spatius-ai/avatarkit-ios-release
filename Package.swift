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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.0.0-beta.2-rtc/AvatarKit_202606031548.zip",
            checksum: "9af25c3948006d9bc80c5f86103c1db5087640d8add490c43ca482d7ea4ce02e"
        )
    ]
)

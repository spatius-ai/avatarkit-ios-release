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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.3/AvatarKit_202608171818.zip",
            checksum: "10fe93afb7d78d516af43d58463339e0addc7f685e8c13b45b346a67bb73bf3e"
        )
    ]
)

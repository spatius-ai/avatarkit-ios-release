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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.0.0-beta.1-rtc/AvatarKit_202606020501.zip",
            checksum: "31ae17e9c3e28a4cc98e9ccac4a1b5198d61a82136018ac57a5af53c8468e010"
        )
    ]
)

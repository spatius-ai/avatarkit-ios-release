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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.7-beta.1/AvatarKit_202610152317.zip",
            checksum: "5527cecd34b135c64ea79aafab4ba75a47aac44e0847e9aa2956697d167c6841"
        )
    ]
)

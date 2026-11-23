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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.10/AvatarKit-1.3.10.zip",
            checksum: "7a819b1ea802ba10c24f4f81aaa966a2f542e902dd155960a06df5f942450530"
        )
    ]
)

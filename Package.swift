// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AvatarKit",
    platforms: [.iOS(.v13)],
    products: [
        .library(name: "AvatarKit", targets: ["AvatarKit"])
    ],
    targets: [
        .binaryTarget(
            name: "AvatarKit",
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.9-compat-ios13/AvatarKit_202611182040.zip",
            checksum: "55e708b943df244242e72ab497342bbf63316cc501c69ef56891d41665b02076"
        )
    ]
)

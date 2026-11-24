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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.10-compat-ios13/AvatarKit-1.3.10-compat-ios13.zip",
            checksum: "2babb943ed52e67280422dcfc22ad602cdd5bccb64b2de663598371ce8722983"
        )
    ]
)

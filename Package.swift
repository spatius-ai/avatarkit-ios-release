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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.3-beta.1/AvatarKit_202608120055.zip",
            checksum: "8cded090555b2c8db17472ae34370148feed64c1ae4a826b5fe9c16914268202"
        )
    ]
)

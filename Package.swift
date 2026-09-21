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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.6-beta.2/AvatarKit_202609220348.zip",
            checksum: "f7126061aa2b7c2d8a31b0d544197d904282cafd6964be7998ea2426cfd3cddf"
        )
    ]
)

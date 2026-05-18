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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.0.0/AvatarKit_202605190156.zip",
            checksum: "332f1826a9872adfe0f0b21ecbf364b72491aac3bb71238eb9808a2620df1563"
        )
    ]
)

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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.5/AvatarKit_202609180015.zip",
            checksum: "3ef5322b1df8afcea6ef648a090daa7919fa62b5031dd6b2d6a116eb65c9756b"
        )
    ]
)

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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.6-beta.1/AvatarKit_202609211508.zip",
            checksum: "bcdfd9e17592cba5eed7cf50bccf0ae29a11c8091111f845ae4c21531dbcb36f"
        )
    ]
)

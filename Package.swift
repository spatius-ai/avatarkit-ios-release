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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.6-compat-ios13/AvatarKit_202611020202.zip",
            checksum: "35cd09114d358a606a357a3f7af09fc9b422188428c35f5f99844f6519c7e57f"
        )
    ]
)

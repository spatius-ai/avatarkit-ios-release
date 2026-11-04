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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.8/AvatarKit_202611042157.zip",
            checksum: "334a3039364d00bf80d249477c55c8c11fcae074df0e66042b00b76dde4c3139"
        )
    ]
)

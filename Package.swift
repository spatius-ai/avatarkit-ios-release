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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.1/AvatarKit_202608071708.zip",
            checksum: "8cf32a08466be965885a7cdb80969874966c69827707c734cab4f39f5e2cf6f2"
        )
    ]
)

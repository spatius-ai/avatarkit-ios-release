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
            url: "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.4/AvatarKit_202608311739.zip",
            checksum: "bbe56fc481d27da764040d77031fc11e52870a1762b2cf4b77a4ba516fc5f12c"
        )
    ]
)

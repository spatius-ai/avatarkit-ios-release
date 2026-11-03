# AvatarKit iOS SDK

AvatarKit — real-time, audio-driven avatar rendering SDK for iOS.

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/spatius-ai/avatarkit-ios-release.git", from: "1.3.0")
]
```

### CocoaPods

CocoaPods trunk no longer accepts new versions, so AvatarKit is published to its own
[spec repo](https://github.com/spatius-ai/avatarkit-specs). Add it as a source at the top
of your `Podfile`, and keep the CocoaPods CDN for third-party dependencies:

```ruby
source 'https://github.com/spatius-ai/avatarkit-specs.git'
source 'https://cdn.cocoapods.org/'

pod 'SpatiusAvatarKit', '~> 1.3.0'
```

The import name stays `AvatarKit` regardless of which one you use:

```swift
import AvatarKit
```

### XCFramework (Binary)

Download the latest `AvatarKit.xcframework` from [Releases](https://github.com/spatius-ai/avatarkit-ios-release/releases), drag it into your Xcode project, and set it to **Embed & Sign**.

## Requirements

- iOS 16.0+
- Metal, AVFoundation
- arm64

## Documentation

Full quickstart, API reference, and integration guides:

**https://docs.spatius.ai/quickstarts/ios-sdk**

## Support

- Email: hello@spatialwalk.net
- Docs: https://docs.spatius.ai

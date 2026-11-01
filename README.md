# AvatarKit iOS SDK

AvatarKit — real-time, audio-driven avatar rendering SDK for iOS.

> **iOS 13 compat build — `1.3.6-compat-ios13`.** This branch is AvatarKit 1.3.6
> with a 13.0 deployment target, for apps that still deploy to iOS 13–15. Every
> AvatarKit API is marked `@available(iOS 16.0, *)`; on iOS 16 and later it
> behaves exactly like 1.3.6. Install it by its full version (SPM
> `exact: "1.3.6-compat-ios13"`, CocoaPods `pod 'SpatiusAvatarKit', '1.3.6-compat-ios13'`).

## Installation

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/spatius-ai/avatarkit-ios-release.git", from: "1.3.0")
]
```

### CocoaPods

```ruby
pod 'SpatiusAvatarKit', '~> 1.3.0'
```

The import name stays `AvatarKit` regardless of which one you use:

```swift
import AvatarKit
```

### XCFramework (Binary)

Download the latest `AvatarKit.xcframework` from [Releases](https://github.com/spatius-ai/avatarkit-ios-release/releases), drag it into your Xcode project, and set it to **Embed & Sign**.

## Requirements

- iOS 13.0+ deployment target (`compat-ios13` build). Call AvatarKit only inside
  `if #available(iOS 16.0, *)`: on iOS 13–15 the app links and launches, but
  AvatarKit must not be used.
- Metal, AVFoundation
- arm64

## Documentation

Full quickstart, API reference, and integration guides:

**https://docs.spatius.ai/quickstarts/ios-sdk**

## Support

- Email: hello@spatialwalk.net
- Docs: https://docs.spatius.ai

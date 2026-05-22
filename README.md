# AvatarKit iOS SDK

Real-time virtual avatar rendering SDK for iOS, supporting audio-driven animation and high-quality 3D rendering with Metal.

## Features

- **High-Quality 3D Rendering** - Metal-based GPU-accelerated avatar rendering
- **Audio-Driven Real-Time Animation** - Send audio data, SDK handles animation and rendering
- **Dual Mode** - Direct mode (server-driven) and Backend mode (client-driven) for flexible integration
- **Swift 6 Concurrency** - Full `Sendable` and `@MainActor` safety
- **SwiftUI & UIKit** - Native `UIView` with SwiftUI `UIViewRepresentable` wrapper
- **Local Caching** - Smart LRU cache with configurable retention
- **Lifecycle Management** - Automatic background/foreground handling

## Installation

### XCFramework (Binary)

1. Download the latest XCFramework from [Releases](https://github.com/spatialwalk/avatar-kit-ios-release/releases)

2. Unzip and drag `AvatarKit.xcframework` into your Xcode project

3. In your target's "General" tab, ensure it appears under "Frameworks, Libraries, and Embedded Content" with "Embed & Sign"

### CocoaPods

```ruby
pod 'AvatarKit', :git => 'https://github.com/spatialwalk/Spatial-Walk-Apple.git', :branch => 'main'
```

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/spatialwalk/Spatial-Walk-Apple.git", branch: "main")
]
```

## Platform Requirements

- **iOS**: 16.0+
- **Swift**: 6.2
- **Frameworks**: Metal, AVFoundation
- **Architecture**: arm64

## Authentication

All environments require an **App ID** and **Session Token** for authentication.

### App ID

1. **For Testing**: Use the default test App ID provided in the demo app
2. **For Production**: Visit the [Developer Platform](https://dash.spatialreal.ai) to create your own App

### Session Token

The Session Token is required for authentication.

**Important:**
- The Session Token must be valid and not expired
- In production, you **must** provide a valid Session Token from your SDK provider

## Quick Start

### Basic Usage (SDK Mode)

```swift
import AvatarKit

// 1. Initialize SDK
AvatarSDK.initialize(
    appID: "your-app-id",
    configuration: Configuration(
        environment: .intl,
        audioFormat: AudioFormat(sampleRate: 16000), // ⚠️ Must match your actual audio sample rate. Mismatched rate will cause playback issues.
        drivingServiceMode: .direct,
        logLevel: .off
    )
)
AvatarSDK.sessionToken = "your-session-token"

// 2. Load avatar
let avatar = try await AvatarManager.shared.load(id: "character-id") { progress in
    print("Loading: \(progress.fractionCompleted * 100)%")
}

// 3. Create view
let avatarView = AvatarView(avatar: avatar)
// Add to your view hierarchy

// 4. Setup callbacks
avatarView.controller.onConnectionState = { state in
    print("Connection: \(state)")
}
avatarView.controller.onConversationState = { state in
    print("Conversation: \(state)")
}

// 5. Start connection
// Note: start() initiates the WebSocket connection asynchronously.
// Wait for onConnectionState === .connected before calling send().
avatarView.controller.onConnectionState = { state in
    if case .connected = state {
        // Connection ready, now safe to send audio
    }
}
avatarView.controller.start()

// 6. Send audio data (only after connected, PCM16 mono, matching configured sample rate)
let audioData: Data = ... // PCM16 audio data
avatarView.controller.send(audioData, end: false)
// end=true marks end of audio input, NOT end of playback.
// Avatar continues playing remaining animation, then returns to idle (notified via onConversationState).
avatarView.controller.send(Data(), end: true)
```

### Host Mode Example

```swift
// 1-3. Same as Direct mode (initialize, load avatar, create view)
// Use drivingServiceMode: .backend in Configuration

// 4. Yield audio data
let conversationID = avatarView.controller.yield(audioData, end: false)

// 5. Yield animation data
avatarView.controller.yield(animationDataArray, conversationID: conversationID)
```

### SwiftUI Integration

```swift
struct AvatarScreen: View {
    @State private var avatarView: AvatarView?

    var body: some View {
        if let avatarView {
            AvatarViewWrapper(avatarView: avatarView)
                .ignoresSafeArea()
        }
    }
}

struct AvatarViewWrapper: UIViewRepresentable {
    let avatarView: AvatarView

    func makeUIView(context: Context) -> AvatarView {
        return avatarView
    }

    func updateUIView(_ uiView: AvatarView, context: Context) {}
}
```

## API Reference

### AvatarSDK

```swift
// Initialize SDK
AvatarSDK.initialize(appID: String, configuration: Configuration)

// Properties
AvatarSDK.appID: String
AvatarSDK.sessionToken: String
AvatarSDK.userID: String
AvatarSDK.configuration: Configuration
AvatarSDK.version: String
AvatarSDK.supportsCurrentDevice: Bool
AvatarSDK.domain: String

// Benchmark
let score = await AvatarSDK.benchmark()
```

### AvatarManager

```swift
let manager = AvatarManager.shared

// Load avatar from server (with caching)
let avatar = try await manager.load(
    id: String,
    onProgress: ((Progress) -> Void)? = nil
) -> Avatar

// Load from local assets
let avatar = try manager.derive(assetPath: String) -> Avatar

// Retrieve from cache only (no download)
let avatar = manager.retrieve(id: String) -> Avatar?

// Cancel loading
manager.cancelLoading(id: String)
manager.cancelAllLoading()

// Cache management
try manager.clear(id: String)
try manager.clearAll()
try manager.clearLRU(keepCount: Int)
let size = try manager.getCacheSize(id: String) -> Int
let totalSize = try manager.getAllCacheSize() -> Int
```

### AvatarView

```swift
let avatarView = AvatarView(avatar: Avatar)

avatarView.controller: AvatarController
avatarView.avatarTransform: Transform

avatarView.pauseRendering()
avatarView.resumeRendering()
avatarView.isRenderingEnabled() -> Bool
avatarView.isOpaque: Bool
```

### AvatarController

#### State & Callbacks

```swift
controller.onFirstRendering: (() -> Void)?
controller.onConnectionState: ((ConnectionState) -> Void)?
controller.onConversationState: ((ConversationState) -> Void)?
controller.onError: ((AvatarError) -> Void)?

controller.isRendering: Bool
controller.pointCount: Int
controller.volume: Float  // 0.0 - 1.0
```

#### SDK Mode Methods

```swift
controller.start()
controller.close()

@discardableResult
controller.send(_ audioData: Data, end: Bool = false) -> String
```

#### Host Mode Methods

```swift
@discardableResult
controller.yield(_ audioData: Data, end: Bool = false, audioFormat: AudioFormat? = nil) -> String

controller.yield(_ animations: [Data], conversationID: String)
```

#### Common Methods (Both Modes)

```swift
controller.pause()
controller.resume()
controller.interrupt()
```

## Configuration

### Configuration

```swift
public struct Configuration {
    let environment: Environment
    let audioFormat: AudioFormat
    let drivingServiceMode: DrivingServiceMode
    let logLevel: LogLevel

    init(
        environment: Environment,
        audioFormat: AudioFormat = AudioFormat(),
        drivingServiceMode: DrivingServiceMode = .direct,
        logLevel: LogLevel = .off
    )
}
```

### Environment

```swift
enum Environment: String {
    case cn    // China region
    case intl  // International region
}
```

### AudioFormat

```swift
struct AudioFormat {
    let channelCount: Int  // Fixed to 1 (mono)
    let sampleRate: Int    // Default: 16000 Hz

    init(sampleRate: Int = 16000)
}
```

Supported sample rates: 8000, 16000, 22050, 24000, 32000, 44100, 48000 Hz

### DrivingServiceMode

```swift
enum DrivingServiceMode: String {
    case sdk   // Server-driven (default)
    case host  // Client-driven
}
```

### LogLevel

```swift
enum LogLevel: String {
    case off
    case error
    case warning
    case all
}
```

### Transform

```swift
struct Transform {
    static let identity: Transform

    let x: Float     // Horizontal offset (-1 to 1)
    let y: Float     // Vertical offset (-1 to 1)
    let scale: Float // Scale factor (default: 1.0)

    init(x: Float = 0.0, y: Float = 0.0, scale: Float = 1.0)
}
```

## State Management

### ConnectionState

```swift
enum ConnectionState {
    case disconnected
    case connecting
    case connected
    case failed(Error)
}
```

### ConversationState

```swift
enum ConversationState: String {
    case idle      // Idle (breathing animation)
    case paused    // Paused during playback
    case playing   // Active conversation
}
```

## Error Handling

### AvatarError

```swift
enum AvatarError: LocalizedError {
    case appIDUnrecognized
    case avatarIDUnrecognized
    case avatarAssetMissing
    case sessionTokenInvalid          // WebSocket close code 4010
    case sessionTokenExpired          // WebSocket close code 4010
    case insufficientBalance          // WebSocket close code 4001
    case sessionTimeout               // WebSocket close code 4002
    case concurrentLimitExceeded      // WebSocket close code 4003
    case failedToFetchAvatarMetadata
    case failedToDownloadAvatarAssets
    case serverError(code: Int, message: String)
}
```

### Error Callbacks

```swift
avatarView.controller.onError = { error in
    print("Error: \(error.localizedDescription)")
    // error is AvatarError, switch on specific cases for handling
}
```

## Resource Management

### Lifecycle

```swift
let avatarView = AvatarView(avatar: avatar)
avatarView.controller.start()

avatarView.controller.send(audioData, end: false)

avatarView.pauseRendering()
avatarView.resumeRendering()

avatarView.controller.close()
```

### Switching Avatars

To switch avatars, dispose the old view and create a new one. Do NOT attempt to reuse or reset an existing AvatarView.
`AvatarSDK.initialize()` and session token do not need to be called again.

```swift
// 1. Dispose old avatar
avatarView.controller.close()
avatarView = nil

// 2. Load new avatar (SDK is already initialized, token is still valid)
let newAvatar = try await AvatarManager.shared.load("new-character-id")

// 3. Create new AvatarView
avatarView = AvatarView(avatar: newAvatar)
avatarView.controller.start()
```

**Automatic Lifecycle Handling:**
- App enters background → rendering pauses, audio stops
- App returns to foreground → rendering and audio resume
- View removed from window → rendering stops
- View added to window → rendering resumes

### Cache Management

```swift
let size = try AvatarManager.shared.getAllCacheSize()
try AvatarManager.shared.clear(id: "avatar-id")
try AvatarManager.shared.clearAll()
try AvatarManager.shared.clearLRU(keepCount: 3)
```

## License

MIT License

## Support

- Email: code@spatialwalk.net
- Documentation: https://docs.spatialreal.ai

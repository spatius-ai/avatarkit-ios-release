Pod::Spec.new do |spec|
  spec.name         = "SpatiusAvatarKit"
  # Import name stays `AvatarKit` (`import AvatarKit`).
  spec.module_name  = "AvatarKit"
  spec.version      = "1.3.1-beta.1"
  spec.summary      = "AvatarKit — real-time, audio-driven avatar rendering SDK for iOS."
  spec.description  = <<-DESC
                      SpatiusAvatarKit is a high-performance avatar rendering SDK that provides
                      real-time rendering and audio-driven capabilities. Distributed as a
                      self-contained, prebuilt xcframework.
                      DESC
  spec.homepage     = "https://github.com/spatius-ai/avatarkit-ios-release"
  spec.license      = {
    :type => "Commercial",
    :text => "Copyright © 2026 Spatius. All rights reserved. Use is subject to the Spatius commercial license agreement."
  }
  spec.author       = { "Spatius" => "hello@spatialwalk.net" }
  spec.platform     = :ios, "16.0"

  spec.source = {
    :http => "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.1-beta.1/AvatarKit_202607310002.zip"
  }
  spec.vendored_frameworks = "AvatarKit.xcframework"

  # arm64-only slices; exclude x86_64 simulator so linking doesn't look for a
  # missing slice.
  spec.pod_target_xcconfig  = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "x86_64" }
  spec.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "x86_64" }
end

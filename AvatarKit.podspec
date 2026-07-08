Pod::Spec.new do |spec|
  spec.name         = "AvatarKit"
  spec.version      = "1.3.0"
  spec.summary      = "AvatarKit - Spatius Avatar Kit"
  spec.description  = <<-DESC
                      AvatarKit is a high-performance avatar rendering SDK that provides
                      real-time rendering and audio-driven capabilities. Distributed as a
                      self-contained, prebuilt xcframework.
                      DESC
  spec.homepage     = "https://github.com/spatius-ai/avatarkit-ios-release"
  spec.license      = { :type => "Commercial" }
  spec.author       = { "Spatius" => "hello@spatialwalk.net" }
  spec.platform     = :ios, "16.0"

  # Prebuilt binary — same artifact consumed by the SPM binaryTarget.
  # The zip's top-level entry is `AvatarKit.xcframework/`, so vendored_frameworks
  # references it directly with no wrapping directory.
  spec.source = {
    :http => "https://github.com/spatius-ai/avatarkit-ios-release/releases/download/v1.3.0/AvatarKit_202607050409.zip"
  }
  spec.vendored_frameworks = "AvatarKit.xcframework"

  # The xcframework ships arm64-only slices (device + simulator). Intel (x86_64)
  # simulator is not built, so exclude it — otherwise linking a Rosetta/Intel
  # simulator build fails to find a matching slice.
  spec.pod_target_xcconfig  = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "x86_64" }
  spec.user_target_xcconfig = { "EXCLUDED_ARCHS[sdk=iphonesimulator*]" => "x86_64" }

  # No third-party pod dependencies: SPAvatarCore / SwiftProtobuf / PostHog /
  # OpenTelemetry are all statically linked into the xcframework. Verified via
  # `otool -L` (only system libs) — do NOT add them here.
end

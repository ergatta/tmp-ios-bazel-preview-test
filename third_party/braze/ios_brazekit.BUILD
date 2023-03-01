load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_xcframework_import")

package(
    default_visibility = ["//visibility:public"],
)

apple_static_xcframework_import(
    name = "BrazeKit",
    xcframework_imports = glob(["BrazeKit.xcframework/**"]),
    library_identifiers = {
        "tvos_device": "tvos-arm64",
        "tvos_simulator": "tvos-arm64_x86_64-simulator",
        "macos": "ios-arm64_x86_64-maccatalyst",
        "ios_simulator": "ios-arm64_i386_x86_64-simulator",
        "ios_device": "ios-arm64_armv7",
    }
)
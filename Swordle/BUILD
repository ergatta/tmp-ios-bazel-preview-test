load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "Swordle",
    srcs = glob([
        "*.swift"
    ]),
    data = [
        "//Assets:Assets"
    ]
)

ios_application(
    name = "swordle",
    bundle_id = "me.swaminathan.Swordle",
    infoplists = ["Info.plist"],
    families = ["iphone"],
    minimum_os_version = "15.2",
    deps = [
        ":Swordle",
    ]
)

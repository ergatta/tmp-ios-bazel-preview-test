load("@build_bazel_rules_apple//apple:resources.bzl", "apple_resource_bundle")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

package(
    default_visibility = ["//visibility:private"],
)

apple_resource_bundle(
    name = "BrazeKitResources",
    bundle_name = "BrazeKit",
    resources = glob(["Sources/BrazeKitResources/Resources/**"]),
)

apple_resource_bundle(
    name = "BrazeUIResources",
    bundle_name = "BrazeUI",
    resources = glob(["Sources/BrazeUI/Resources/**"]),
)

swift_library(
    name = "BrazeUI",
    visibility = ["//visibility:public"],
    srcs = glob([
        "Sources/BrazeUI/**/*.swift",
    ]),
    module_name = "BrazeUI",
    data = [":BrazeKitResources", ":BrazeUIResources"],
    deps = [
        "@BrazeKit//:BrazeKit",
    ],
    tags = ["manual"],
)

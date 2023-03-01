load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

def lib_variant(
        name,
        module_name,
        srcs = [],
        data = [],
        defines = [],
        linkopts = [],
        deps = [],
        tags = [],
        visibility = None):
    swift_library(
        name = name,
        srcs = srcs + native.glob([
            "Sources/*.swift"
        ]),
        module_name = module_name,
        data = data + [":Swordle_Resources"],
        defines = defines + select({
            "//:is_release_build": ["RELEASE=1"],
            "//conditions:default": ["DEBUG=1"],
        }),
        linkopts = linkopts + ["-ObjC"],
        deps = [
            "@Firebase//:FirebaseAnalytics",
            "@Firebase//:FirebaseCore",
            "@Firebase//:FirebaseCrashlytics",
            "@Firebase//:FirebaseMessaging",
            "@Firebase//:FirebaseRemoteConfig",
            "@swift_pkgs//Alamofire",
            "@swift_pkgs//SwiftUI-Shimmer:Shimmer",
            "@BrazeKit//:BrazeKit",
            "@BrazeUI//:BrazeUI",
        ],
        tags = tags + ["manual"],
        visibility = visibility,
    )


def app_variant(
        name,
        lib_target,
        bundle_id,
        bundle_name,
        infoplists):
    ios_application(
        name = name,
        bundle_id = bundle_id,
        bundle_name = bundle_name,
        infoplists = infoplists + ["Info/Base.plist"],
        families = ["iphone"],
        minimum_os_version = "15.2",
        version = ":version",
        # linkopts = ["-ObjC"],
        deps = [
            lib_target,
        ],
    )

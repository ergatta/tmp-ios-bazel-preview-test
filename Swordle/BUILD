load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:defs.bzl",
    "xcode_schemes",
    "xcodeproj",
    "top_level_target"
)

swift_library(
    name = "lib_dev",
    srcs = glob([
        "*.swift"
    ]),
    linkopts = ["-ObjC"],
    deps = [
        "@Firebase//:FirebaseAnalytics",
        "@Firebase//:FirebaseCore",
        "@Firebase//:FirebaseCrashlytics",
        "@Firebase//:FirebaseMessaging",
        "@Firebase//:FirebaseRemoteConfig",
    ]
)

ios_application(
    name = "Swordle",
    bundle_id = "me.swaminathan.Swordle",
    infoplists = ["Info.plist"],
    families = ["iphone"],
    minimum_os_version = "15.2",
    # linkopts = ["-ObjC"],
    deps = [
        ":lib_dev",
    ]
)

swift_library(
    name = "lib_staging",
    srcs = glob([
        "*.swift"
    ]),
    linkopts = ["-ObjC"],
    deps = [
        "@Firebase//:FirebaseAnalytics",
        "@Firebase//:FirebaseCore",
        "@Firebase//:FirebaseCrashlytics",
        "@Firebase//:FirebaseMessaging",
        "@Firebase//:FirebaseRemoteConfig",
    ]
)

ios_application(
    name = "Swordle_staging",
    bundle_id = "me.swaminathan.Swordle.staging",
    infoplists = ["Info.plist"],
    families = ["iphone"],
    minimum_os_version = "15.2",
    # linkopts = ["-ObjC"],
    deps = [
        ":lib_staging",
    ]
)

TARGETS = [
    top_level_target(
        label = "//Swordle:Swordle",
        target_environments = ["simulator"],
    ),
    top_level_target(
        label = "//Swordle:Swordle_staging",
        target_environments = ["simulator"],
    ),
]

_SCHEMES = [
    xcode_schemes.scheme(
        name = "Swordle",
        launch_action = xcode_schemes.launch_action(
            target = "//Swordle:Swordle",
        ),
    ),
    xcode_schemes.scheme(
        name = "Swordle Staging",
        launch_action = xcode_schemes.launch_action(
            target = "//Swordle:Swordle_staging",
        ),
    ),
]

xcodeproj(
    name = "xcodeproj",
    project_name = "swordle",
    tags = ["manual"],
    build_mode = "bazel",
    archived_bundles_allowed = True,
    schemes = _SCHEMES,
    top_level_targets = TARGETS,
)

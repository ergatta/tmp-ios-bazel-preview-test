load("@build_bazel_rules_apple//apple:apple.bzl", "apple_static_xcframework_import")

package(
    default_visibility = ["//visibility:public"],
)

apple_static_xcframework_import(
    name = "FirebaseAnalytics",
    xcframework_imports = glob(["FirebaseAnalytics/FirebaseAnalytics.xcframework/**"]),
    deps = [
        ":FirebaseCore",
        ":FirebaseCoreDiagnostics",
        ":FirebaseInstallations",
        ":GoogleAppMeasurement",
        ":GoogleDataTransport",
        ":GoogleUtilities",
        ":PromisesObjC",
        ":nanopb"
    ]
)

apple_static_xcframework_import(
    name = "FirebaseCrashlytics",
    xcframework_imports = glob(["FirebaseCrashlytics/FirebaseCrashlytics.xcframework/**"]),
    deps = [
        ":FirebaseAnalytics"
    ]
)

apple_static_xcframework_import(
    name = "FirebaseMessaging",
    xcframework_imports = glob(["FirebaseMessaging/FirebaseMessaging.xcframework/**"])
)

apple_static_xcframework_import(
    name = "FirebaseRemoteConfig",
    xcframework_imports = glob(["FirebaseRemoteConfig/FirebaseRemoteConfig.xcframework/**"]),
    deps = [
        ":FirebaseABTesting",
    ],
)

apple_static_xcframework_import(
    name = "FirebaseABTesting",
    xcframework_imports = glob(["FirebaseRemoteConfig/FirebaseABTesting.xcframework/**"])
)

apple_static_xcframework_import(
    name = "FirebaseCore",
    xcframework_imports = glob(["FirebaseAnalytics/FirebaseCore.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "FirebaseCoreDiagnostics",
    xcframework_imports = glob(["FirebaseAnalytics/FirebaseCoreDiagnostics.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "FirebaseInstallations",
    xcframework_imports = glob(["FirebaseAnalytics/FirebaseInstallations.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "GoogleAppMeasurement",
    xcframework_imports = glob(["FirebaseAnalytics/GoogleAppMeasurement.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "GoogleDataTransport",
    xcframework_imports = glob(["FirebaseAnalytics/GoogleDataTransport.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "GoogleUtilities",
    xcframework_imports = glob(["FirebaseAnalytics/GoogleUtilities.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "PromisesObjC",
    xcframework_imports = glob(["FirebaseAnalytics/PromisesObjC.xcframework/**"]),
)

apple_static_xcframework_import(
    name = "nanopb",
    xcframework_imports = glob(["FirebaseAnalytics/nanopb.xcframework/**"]),
)

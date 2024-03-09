load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "90e3b5e8ff942be134e64a83499974203ea64797fd620eddeb71b3a8e1bff681",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/1.1.2/rules_apple.1.1.2.tar.gz",
)

http_archive(
    name = "com_github_buildbuddy_io_rules_xcodeproj",
    sha256 = "564381b33261ba29e3c8f505de82fc398452700b605d785ce3e4b9dd6c73b623",
    url = "https://github.com/buildbuddy-io/rules_xcodeproj/releases/download/0.9.0/release.tar.gz",
)

load(
    "@com_github_buildbuddy_io_rules_xcodeproj//xcodeproj:repositories.bzl",
    "xcodeproj_rules_dependencies",
)

xcodeproj_rules_dependencies()

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:repositories.bzl",
    "swift_rules_dependencies",
)

swift_rules_dependencies()

load(
    "@build_bazel_rules_swift//swift:extras.bzl",
    "swift_rules_extra_dependencies",
)

swift_rules_extra_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()

http_archive(
    name = "Firebase",
    urls = ["https://github.com/firebase/firebase-ios-sdk/releases/download/v8.9.1/Firebase.zip"],
    sha256 = "e03dc8fe6459f276391d1bfec7d7b90ae59fc457a5120724c702b86e954a32dd",
    build_file = "@//:third_party/firebase-ios/firebase.BUILD",
    strip_prefix = "Firebase"
)

http_archive(
    name = "BrazeKit",
    urls = ["https://github.com/braze-inc/braze-swift-sdk/releases/download/5.5.0/BrazeKit.zip"],
    sha256 = "a20b8922491b014387b09f8284738585a700735b5f48ff88446ba7e3d2422544",
    build_file = "@//:third_party/braze/ios_brazekit.BUILD",
)

http_archive(
    name = "BrazeUI",
    urls = ["https://github.com/braze-inc/braze-swift-sdk/archive/refs/tags/5.5.0.zip"],
    sha256 = "6540e762e6a2767d94a9a68381b72bedc9728b68c421db99f725c09bff0bbc3e",
    build_file = "@//:third_party/braze/ios_brazeui.BUILD",
    strip_prefix = "braze-swift-sdk-5.5.0",
)

http_archive(
    name = "cgrindel_rules_spm",
    sha256 = "03718eb865a100ba4449ebcbca6d97bf6ea78fa17346ce6d55532312e8bf9aa8",
    strip_prefix = "rules_spm-0.11.0",
    urls = [
        "http://github.com/cgrindel/rules_spm/archive/v0.11.0.tar.gz",
    ],
)

load(
    "@cgrindel_rules_spm//spm:deps.bzl",
    "spm_rules_dependencies",
)

spm_rules_dependencies()

load("@cgrindel_rules_spm//spm:defs.bzl", "spm_pkg", "spm_repositories")

spm_repositories(
    name = "swift_pkgs",
    platforms = [
        ".iOS(.v10)",
        ".macOS(.v10_15)",
    ],
    dependencies = [
        spm_pkg(
            url = "https://github.com/Alamofire/Alamofire.git",
            exact_version = "5.6.1",
            products = ["Alamofire"],
        ),
        spm_pkg(
            url = "https://github.com/markiv/SwiftUI-Shimmer",
            exact_version = "1.0.0",
            products = ["Shimmer"]
        ),
    ],
)

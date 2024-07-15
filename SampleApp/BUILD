load("@build_bazel_rules_apple//apple:ios.bzl", "ios_application")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "sample_lib_provident",
    srcs = glob(["SampleApp/**/*.swift"]),
)

ios_application(
    name = "sample_app_provident",
    bundle_id = "uk.co.cerihughes.provident.sample",
    families = [
        "iphone",
        "ipad",
    ],
    infoplists = ["SampleApp/Info.plist"],
    minimum_os_version = "16.0",
    visibility = ["//visibility:public"],
    deps = [":sample_lib_provident", "//Source:lib_provident"],
)
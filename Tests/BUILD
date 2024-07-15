load("@build_bazel_rules_apple//apple:ios.bzl", "ios_unit_test")
load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "lib_provident_test",
    srcs = glob(["*.swift"]),
    tags = ["manual"],
    deps = ["//Source:lib_provident"],
    visibility = ["//visibility:private"],
)

ios_unit_test(
    name = "bundle_provident_test",
    deps = ["lib_provident_test"],
    minimum_os_version = "16.0",
    families = [
        "iphone",
        "ipad",
    ],
)
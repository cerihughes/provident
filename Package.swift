// swift-tools-version:5.7
import PackageDescription

let package = Package(name: "Provident",
                      platforms: [.iOS(.v16)],
                      products: [
                          .library(name: "Provident", targets: ["Provident"])
                      ],
                      dependencies: [
                      ],
                      targets: [
                          .target(name: "Provident",
                                  path: "Source"),
                          .testTarget(name: "ProvidentTests",
                                      dependencies: ["Provident"],
                                      path: "Tests")
                      ])

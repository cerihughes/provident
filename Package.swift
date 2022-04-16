// swift-tools-version:5.3
import PackageDescription

let package = Package(name: "Provident",
                      platforms: [.iOS(.v13)],
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

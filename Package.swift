// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ReMonitor",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "ReMonitor",
            targets: ["ReMonitor"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/ReSwift/ReSwift.git", .upToNextMajor(from: "5.0.0")),
    ],
    targets: [
        .target(
            name: "ReMonitor",
            dependencies: ["ReSwift"],
            path: "Sources/Framework"
        ),
    ]
)

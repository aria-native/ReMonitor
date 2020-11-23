// swift-tools-version:5.3

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
        .package(url: "https://github.com/Kuniwak/MirrorDiffKit.git", .upToNextMajor(from: "5.0.1")),
        .package(url: "https://github.com/ReSwift/ReSwift.git", .upToNextMajor(from: "5.0.0")),
        .package(url: "https://github.com/YusukeHosonuma/SwiftPrettyPrint.git", .upToNextMajor(from: "1.0.0")),
        .package(url: "https://github.com/kyle-n/HighlightedTextEditor.git", .upToNextMajor(from: "1.5.1")),
    ],
    targets: [
        .target(
            name: "ReMonitor",
            dependencies: [
                "HighlightedTextEditor",
                "MirrorDiffKit",
                "ReSwift",
                "SwiftPrettyPrint",
            ],
            path: "Sources/Framework"
        ),
    ]
)

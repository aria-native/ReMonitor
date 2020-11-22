// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "BuildTools",
    platforms: [.macOS(.v10_11)],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.47.4"),
        .package(url: "https://github.com/realm/SwiftLint.git", from: "0.41.0"),
    ],
    targets: [.target(name: "BuildTools", path: "")]
)

// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "KeyHolder",
    platforms: [
      .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "KeyHolder",
            targets: ["KeyHolder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/akring/Magnet", .upToNextMinor(from: "3.4.1")),
    ],
    targets: [
        .target(
            name: "KeyHolder",
            dependencies: ["Magnet"],
            path: "Lib/KeyHolder"),
        .testTarget(
            name: "KeyHolderTests",
            dependencies: ["KeyHolder"],
            path: "Lib/KeyHolderTests"),
    ],
    swiftLanguageVersions: [.v5]
)

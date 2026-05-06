// swift-tools-version:5.10
import PackageDescription

let package = Package(
    name: "KeyHolder",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_13),
    ],
    products: [
        .library(
            name: "KeyHolder",
            targets: ["KeyHolder"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/Clipy/Magnet", from: "3.4.0"),
    ],
    targets: [
        .target(
            name: "KeyHolder",
            dependencies: ["Magnet"],
            path: "Lib/KeyHolder"
        ),
        .testTarget(
            name: "KeyHolderTests",
            dependencies: ["KeyHolder"],
            path: "Lib/KeyHolderTests"
        ),
    ],
    swiftLanguageVersions: [.v5]
)

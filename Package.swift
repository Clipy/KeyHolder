// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "KeyHolder",
    platforms: [
      .macOS(.v11)
    ],
    products: [
        .library(
            name: "KeyHolder",
            targets: ["KeyHolder"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Clipy/Magnet", .upToNextMinor(from: "3.5.0")),
        .package(url: "https://github.com/Clipy/Sauce", .upToNextMinor(from: "2.5.0")),
    ],
    targets: [
        .target(
            name: "KeyHolder",
            dependencies: ["Magnet", "Sauce"]
        ),
        .testTarget(
            name: "KeyHolderTests",
            dependencies: ["KeyHolder"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)

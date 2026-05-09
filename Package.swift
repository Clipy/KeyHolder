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
    ],
    targets: [
        .target(
            name: "KeyHolder",
            dependencies: ["Magnet"],
            path: "Lib/KeyHolder",
            exclude: ["Info.plist"]
        ),
        .testTarget(
            name: "KeyHolderTests",
            dependencies: ["KeyHolder"],
            path: "Lib/KeyHolderTests",
            exclude: ["Info.plist"]
        ),
    ],
    swiftLanguageVersions: [.v5]
)

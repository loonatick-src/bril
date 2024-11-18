// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Bril",
    products: [
        .library(
            name: "Bril",
            targets: ["Bril"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Bril",
            dependencies: []),
        .testTarget(
            name: "BrilTests",
            dependencies: ["Bril"]),
    ]
)

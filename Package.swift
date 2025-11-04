// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WWAutolayoutConstraint",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "WWAutolayoutConstraint", targets: ["WWAutolayoutConstraint"]),
    ],
    targets: [
        .target(name: "WWAutolayoutConstraint", resources: [.copy("Privacy")]),
    ],
    swiftLanguageVersions: [
        .v5
    ]
)

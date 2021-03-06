// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import class Foundation.ProcessInfo

func resolveTargets() -> [Target] {
    let baseTargets: [Target] = [
        .target(name: "RevenueCat",
                path: ".",
                exclude: ["Purchases/Info.plist", "RequiresXcode13"],
                sources: ["Purchases"]
        )
        // Note: publicHeadersPath: "Purchases/Public" doesn't actually pick up .h headers in Swift projects.
    ]

    return baseTargets
}

let package = Package(
    name: "RevenueCat",
    platforms: [
        .macOS(.v10_12), .iOS(.v9), .watchOS("6.2"), .tvOS(.v9)
    ],
    products: [
        .library(name: "RevenueCat",
                 targets: ["RevenueCat"])
    ],
    dependencies: [],
    targets: resolveTargets()
)

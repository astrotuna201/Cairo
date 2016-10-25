import PackageDescription

let package = Package(
    name: "Cairo",
    targets: [
        Target(
            name: "Cairo")
    ],
    dependencies: [
        .Package(url: "https://github.com/astrotuna201/CFontConfig.git", majorVersion: 1),
        .Package(url: "https://github.com/astrotuna201/CFreeType.git", majorVersion: 1),
        .Package(url: "https://github.com/astrotuna201/CCairo.git", majorVersion: 1)
    ],
    exclude: ["Xcode", "Sources/CairoUnitTests"]
)

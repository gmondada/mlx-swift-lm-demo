// swift-tools-version: 6.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "mlx-swift-lm-demo",
    platforms: [.macOS(.v14)],
    dependencies: [
        .package(url: "https://github.com/wendylabsinc/mlx-swift-lm", branch: "gab/test-jetson-lm"),
        .package(url: "https://github.com/huggingface/swift-huggingface", from: "0.9.0"),
        .package(url: "https://github.com/huggingface/swift-transformers", from: "1.3.0"),
    ],
    targets: [
        .executableTarget(
            name: "mlx-swift-lm-demo",
            dependencies: [
                .product(name: "MLXLLM", package: "mlx-swift-lm"),
                .product(name: "MLXLMCommon", package: "mlx-swift-lm"),
                .product(name: "MLXHuggingFace", package: "mlx-swift-lm"),
                .product(name: "HuggingFace", package: "swift-huggingface"),
                .product(name: "Tokenizers", package: "swift-transformers")
            ]
        ),
        .testTarget(
            name: "mlx-swift-lm-demo-tests",
            dependencies: ["mlx-swift-lm-demo"]
        ),
    ],
    swiftLanguageModes: [.v6]
)

// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "BTScreenShot",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BTScreenShot",
            targets: ["BTScreenShotWrapper"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "2.0.3"),
    ],
    targets: [
        // ========== Wrapper Target（统一管理系统依赖）==========
        .target(
            name: "BTScreenShotWrapper",
            dependencies: [
                .byName(name: "BTScreenShot"),
                .product(name: "BTSDKUIKitCore", package: "BTSDKUIKitCore"),
            ],
            path: "BTScreenShotWrapper",
            linkerSettings: [
                // iOS 系统框架
                .linkedFramework("Photos"),
                
                // 系统库
            ]
        ),
        
        // ========== Binary Frameworks ==========
        .binaryTarget(
            name: "BTScreenShot",
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTScreenShot/2.0.3-dev-1481354/BTScreenShot.xcframework.zip",
            checksum: "39ecaf33f564e9e31fded36908cd67b3913e961f1c867b35bfbe7bd45c07bf86"
        )
    ]
)

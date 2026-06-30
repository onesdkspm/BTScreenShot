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
        .package(url: "https://github.com/onesdkspm/BTSDKUIKitCore.git", from: "1.0.0"),
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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTScreenShot/1.2.0-dev-1474872/BTScreenShot.xcframework.zip",
            checksum: "8a507576b7c7fdffa160db7f8f4773e5044dc2f270818d94d6a5be103b425a2e"
        )
    ]
)

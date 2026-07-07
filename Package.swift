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
            url: "https://yw-depot-nexus.100bt.com/repository/onesdk-ios-trunk/spm/BTScreenShot/2.0.2/BTScreenShot.xcframework.zip",
            checksum: "dd16ad75a60f498b25c40069ab2b5502db17dc0ee5d57ad05d6d347092e255b3"
        )
    ]
)

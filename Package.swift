// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "zy_lib_regula_ocr_ios_spm_banbif",

    platforms: [
        .iOS(.v15)
    ],

    products: [
        .library(
            name: "zy_lib_regula_ocr_ios_spm_banbif",
            targets: [
                "ZyRegulaOcrBanbifWrapper"
            ]
        )
    ],

    dependencies: [
        .package(
            url: "https://github.com/ZY-REGULA/RegulaCommonSPM.git",
            exact: "9.5.0"
        ),
        .package(
            url: "https://github.com/ZY-REGULA/DocumentReaderSPM.git",
            exact: "9.5.0"
        ),
        .package(
            url: "https://github.com/ZY-REGULA/DocumentReaderCoreFullAuthSPM.git",
            exact: "9.5.0"
        )
    ],

    targets: [
        .binaryTarget(
            name: "zy_lib_regula_ocr_ios_spm",
            url: "https://repo.zytrust.com/artifactory/zy-mobile-maven/spm/banbif/ocr/1.0.2/zy_lib_regula_ocr_ios_spm_banbif.xcframework.zip",
            checksum: "23c1579e880001e2822423e81ab06de6d3490b0af4e584058b2ea85b9048099b"
        ),
        .target(
            name: "ZyRegulaOcrBanbifWrapper",
            dependencies: [
                "zy_lib_regula_ocr_ios_spm",
                .product(
                    name: "RegulaCommonSPM",
                    package: "regulacommonspm"
                ),
                .product(
                    name: "DocumentReaderSPM",
                    package: "documentreaderspm"
                ),
                .product(
                    name: "DocumentReaderFullAuthSPM",
                    package: "documentreadercorefullauthspm"
                )
            ],
            path: "Sources/Wrapper"
        )
    ]
)

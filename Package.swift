import PackageDescription
 
let package = Package(
    name: "OfficeAppServer",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3)
    ]
)
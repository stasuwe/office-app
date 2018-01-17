import PackageDescription
 
let package = Package(
    name: "OfficeAppServer",
    dependencies: [
        .Package(url: "https://github.com/PerfectlySoft/Perfect-HTTPServer.git", majorVersion: 3),
        .Package(url: "https://github.com/SwiftORM/Postgres-StORM.git", majorVersion: 3)
    ]
)

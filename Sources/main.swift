import PerfectLib
import PerfectHTTP
import PerfectHTTPServer
import PostgresStORM

// Set the DB connection properties
PostgresConnector.host = "localhost"
PostgresConnector.username = "officeApp"
PostgresConnector.password = ""
PostgresConnector.database = "officeAppDB"
PostgresConnector.port = 5432

// Create HTTP server
let server = HTTPServer()

// Register routes
var routes = Routes([APIRoutes.getNews, APIRoutes.addNewsArticle])

// Add routes to server
server.addRoutes(routes)

// Server config
server.serverPort = 8181

do {
    try server.start()
} catch PerfectError.networkError(let err, let msg) {
    print("Network error: \(err) \(msg)")
}


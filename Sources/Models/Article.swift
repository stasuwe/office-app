//
//  Article.swift
//  OfficeAppServerPackageDescription
//
//  Created by Станислав Сарычев on 17.01.2018.
//

import PerfectLib
import StORM
import PostgresStORM

enum ArticleError: Error {
    case invalidJson
}

class Article: PostgresStORM {
    var id: Int = 0
    var title: String = ""
    var body: String = ""
    
    convenience init(title: String, body: String) {
        self.init()
        self.title = title
        self.body = body
    }
    
    convenience init(json: String) throws {
        let parsedJSON = try json.jsonDecode() as! [String: String]
        guard let _title = parsedJSON["title"],
            let _body = parsedJSON["body"] else {
                throw ArticleError.invalidJson
        }
        self.init()
        title = _title
        body = _body
    }
    
    override open func table() -> String {
        return "news"
    }
    
    override func to(_ this: StORMRow) {
        id = this.data["id"] as? Int ?? 0
        title = this.data["title"] as? String ?? ""
        body = this.data["body"] as? String ?? ""
    }
    
    func rows() -> [Article] {
        var rows = [Article]()
        for i in 0..<self.results.rows.count {
            let row = Article()
            row.to(self.results.rows[i])
            rows.append(row)
        }
        return rows
    }
}

extension Article: JSONConvertible {
    func jsonEncodedString() throws -> String {
        return "{\"title\": \"\(title)\",\"body\": \"\(body)\"}"
    }
}

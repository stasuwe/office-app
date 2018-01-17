//
//  Handlers.swift
//  OfficeAppServerPackageDescription
//
//  Created by Станислав Сарычев on 17.01.2018.
//

import PerfectLib
import PerfectHTTP
import StORM
import PostgresStORM

enum APIHandlers {
    static var getNews: RequestHandler {
        return { request, response in
            response.setHeader(.contentType, value: "application/json")
            response.status = .ok
            let article = Article()
            do {
                try article.select(whereclause: "", params: [], orderby: ["id"])
                try response.setBody(json: article.rows())
            } catch {
                response.status = .internalServerError
            }
            response.completed()
        }
    }
    
    static var addNewsArticle: RequestHandler {
        return { request, response in
            response.setHeader(.contentType, value: "application/json")
            response.status = .ok
            do {
                guard let json = request.postBodyString else {
                    throw PerfectError.apiError("invalidJson")
                }
                let article = try Article(json: json)
                try article.save { id in article.id = id as! Int }
                response.setBody(string: "\(article.id)")
            } catch {
                response.status = .internalServerError
            }
            response.completed()
        }
    }
    
}

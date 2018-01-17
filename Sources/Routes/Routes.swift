//
//  Routes.swift
//  OfficeAppServerPackageDescription
//
//  Created by Станислав Сарычев on 17.01.2018.
//

import PerfectLib
import PerfectHTTP

enum APIRoutes {
    static var getNews: Route {
        return  .init(method: .get, uri: "/v1/news", handler: APIHandlers.getNews)
    }
    
    static var addNewsArticle: Route {
        return  .init(method: .post, uri: "/v1/news", handler: APIHandlers.addNewsArticle)
    }
}

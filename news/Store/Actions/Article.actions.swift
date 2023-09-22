//
//  Article.actions.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation

extension Store {
    func setArticles(_ articles: [Article]?) {
        self.articles = articles ?? []
    }
}

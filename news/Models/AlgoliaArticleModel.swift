//
//  AlgoliaArticleModel.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 25..
//

import Foundation
import AlgoliaSearchClient

struct AlgoliaArticleModel: Identifiable, Codable {
    var id: String
    var title: String
    var description: String
    var lead: String
    var imageUrl: String
}

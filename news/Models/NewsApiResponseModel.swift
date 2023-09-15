//
//  NewsApiResponseModel.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 15..
//

import Foundation

struct NewsApiResponse: Decodable {
    var status: String
    var totalResults: Int
    var articles: [Article]
}

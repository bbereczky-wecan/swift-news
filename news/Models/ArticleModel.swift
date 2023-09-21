//
//  ArticleModel.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 15..
//

import Foundation

struct Source: Decodable {
    var id: String?
    var name: String?
    init(name: String? = nil) {
        self.name = name
    }
}

struct Article: Identifiable, Decodable {
    var id: String? = UUID().uuidString
    
    var source: Source?
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String?
    var content: String?

    
    init(title: String, description: String, sourceName: String?, content: String?, urlToImage: String, url: String) {
        self.title = title
        self.description = description
        self.source = Source(name: sourceName)
        self.content = content
        self.urlToImage = urlToImage
        self.url = url
    }
    
    enum CodingKeys: String, CodingKey {
        case title, description, url, urlToImage, publishedAt, content, source
    }
        
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
        self.url = try container.decode(String.self, forKey: .url)
        self.urlToImage = try container.decodeIfPresent(String.self, forKey: .urlToImage) ?? ""
        self.publishedAt = try container.decodeIfPresent(String.self, forKey: .publishedAt)
        self.content = try container.decodeIfPresent(String.self, forKey: .content)
        self.source = try container.decodeIfPresent(Source.self, forKey: .source)
    }
}

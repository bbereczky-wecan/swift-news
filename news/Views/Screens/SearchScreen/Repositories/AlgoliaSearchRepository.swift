//
//  AlgoliaSearchRepository.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 25..
//

import Foundation
import AlgoliaSearchClient

class AlgoliaSearchRepository: Algolia {
    
    func find(_ query: String) {
        self.index.search(query: Query(query)) { result in
            switch result {
            case .success(let response):
                print("All Hits: \(response.hits)") // Print all hits
                
                let articles: [AlgoliaArticleModel] = response.hits.map {
                    let id = $0.objectID.rawValue
                    let title = $0.object["title"] as? String ?? ""
                    let description = $0.object["description"] as? String  ?? ""
                    let lead = $0.object["lead"] as? String ?? ""
                    let imageUrl = $0.object["imageUrl"] as? String  ?? ""
            
                    return AlgoliaArticleModel(id: id, title: title, description: description, lead: lead, imageUrl: imageUrl)
                }.compactMap { $0 }

                print("Mapped Articles: \(articles)") // Print mapped articles
            case .failure(let error):
                print("Error performing search: \(error)")
            }
        }
    }


}

var algoliaSearch = AlgoliaSearchRepository()


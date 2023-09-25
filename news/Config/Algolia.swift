//
//  Algolia.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 25..
//

import Foundation
import AlgoliaSearchClient

class Algolia {
    var client: SearchClient
    var index: Index

    init() {
        let appId = ApplicationID(rawValue: ENV.ALGOLIA_APP_ID)
        let apiKey = APIKey(rawValue: ENV.ALGOLIA_API_KEY)
        let indexName = IndexName(rawValue: ENV.ALGOLIA_INDEX_NAME)
        self.client = SearchClient(appID: appId, apiKey: apiKey)
        self.index = self.client.index(withName: indexName)
    }
}

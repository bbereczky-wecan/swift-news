//
//  ArticleRepository.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 15..
//

import Foundation
import Combine

class ArticleRepository {
    
    @MainActor
    func findAll() async {
        store.startLoading()
        let url = URL(string: "\(ENV.API_URL)/top-headlines?country=us&apiKey=\(ENV.API_KEY)")!
       
        await Http.get(url: url) { (response: NewsApiResponse) in
            store.setArticles(response.articles)
        }
    }
    
    @MainActor
    func findByTitle(title: String) async {
        if (!title.isEmpty) {
            store.startLoading()
            let url = URL(string: "\(ENV.API_URL)/top-headlines?country=us&apiKey=\(ENV.API_KEY)&q=\(title)")!
            
            await Http.get(url: url) { (response: NewsApiResponse) in
                store.setArticles(response.articles)
            }
        } else {
            await findAll()
        }
    }
}

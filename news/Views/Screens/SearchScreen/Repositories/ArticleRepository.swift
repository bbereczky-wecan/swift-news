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
       
        defer {
            store.finishLoading()
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(NewsApiResponse.self, from: data)
            store.setArticles(decodedResponse.articles)
        }
        catch {
            print("Something went wrong. \(error)")
        }
    }
    
    @MainActor
    func findByTitle(title: String) async {
        if (!title.isEmpty) {
            store.startLoading()
            let url = URL(string: "\(ENV.API_URL)/top-headlines?country=us&apiKey=\(ENV.API_KEY)&q=\(title)")!

            defer {
                store.finishLoading()
            }
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decodedResponse = try JSONDecoder().decode(NewsApiResponse.self, from: data)
                store.setArticles(decodedResponse.articles)
            }
            catch {
                print("Something went wrong. \(error)")
            }

        } else {
            await findAll()
        }
    }
}

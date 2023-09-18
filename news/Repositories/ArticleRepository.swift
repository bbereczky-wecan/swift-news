//
//  ArticleRepository.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 15..
//

import Foundation
import Combine

final class ArticleRepository: ObservableObject {
    private var cancellable: AnyCancellable?
    @Published var articles: [Article]?
    
    func findAll() {
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=cb51980d1c314897876a792646c59c10")!
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NewsApiResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main) // Ensure UI updates are on the main thread
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { [weak self] response in
                self?.articles = response.articles
            })
    }
    
    func findByTitle(title: String) {
        if (!title.isEmpty) {
            let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=cb51980d1c314897876a792646c59c10&q=\(title)")!
            
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: NewsApiResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main) // Ensure UI updates are on the main thread
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }, receiveValue: { [weak self] response in
                    self?.articles = response.articles
                })
        } else {
            findAll()
        }
    }
}

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
        let url = URL(string: "\(ENV.API_URL)/top-headlines?country=us&apiKey=\(ENV.API_KEY)")!
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
            let url = URL(string: "\(ENV.API_URL)/top-headlines?country=us&apiKey=\(ENV.API_KEY)&q=\(title)")!
            
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

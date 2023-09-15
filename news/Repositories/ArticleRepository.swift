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

    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=db725ddeb9364ab7a645c52154d2df28")!
    
    func fetchData() {
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
}

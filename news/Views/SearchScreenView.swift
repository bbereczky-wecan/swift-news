//
//  SearchListView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct SearchScreenView: View {
    @ObservedObject var articlesRepository: ArticleRepository
    
    init(articlesRepository: ArticleRepository) {
        self.articlesRepository = articlesRepository
        Task {
            articlesRepository.fetchData()
        }
    }

    var body: some View {
        VStack {
            SearchTextFieldView().padding()
            if let articles = articlesRepository.articles {
                List(articles, id: \.id) { article in SearchListItem(article: article)}
                Spacer()
            }
            Spacer()
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView(articlesRepository: .init())
    }
}

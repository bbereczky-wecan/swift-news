//
//  SearchListView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var store: Store
    private var articlesRepository: ArticleRepository
    
    static var initialized = false
    
    init(articlesRepository: ArticleRepository = ArticleRepository()) {
        self.articlesRepository = articlesRepository
        if !Self.initialized {
            Self.initialized = true
            Task {
                await articlesRepository.findAll()
            }
        }
    }

    var body: some View {
        VStack {
            SearchFormView().frame(height: 120).padding(.bottom, -20)
            List(self.store.articles, id: \.id) { article in SearchListItem(article: article)
            }

            Spacer()
        }
    }

}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView().environmentObject(store)
    }
}

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
            articlesRepository.findAll()
        }
    }
    
    @State private var searchText: String = ""

    var body: some View {
        VStack {
            Form {
                HStack {
                    TextField("Search", text: $searchText)
                        .padding(10)
                        .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                        .submitLabel(.search)
                    Button(action: submit) {
                        Text("Search").padding(10).background(Color.accentPink).fontWeight(.bold).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                    }
                }
            }.frame(height: 120).padding(.bottom, -10)
            if let articles = articlesRepository.articles {
                List(articles, id: \.id) { article in SearchListItem(article: article)}
                
            }
            Spacer()
        }
    }
    
    func submit() {
        Task {
            articlesRepository.findByTitle(title: searchText)
        }
    }
}

struct SearchListView_Previews: PreviewProvider {
    static var previews: some View {
        SearchScreenView(articlesRepository: .init())
    }
}

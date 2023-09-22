//
//  SearchListView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct SearchScreenView: View {
    @EnvironmentObject var store: Store
    private var articlesRepository = ArticleRepository()
    
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
            List(self.store.articles, id: \.id) { article in SearchListItem(article: article)}
            
        
            Spacer()
        }.onAppear {
            Task {
                articlesRepository.findAll()
            }
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
        SearchScreenView().environmentObject(store)
    }
}

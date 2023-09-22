//
//  SearchFormView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import SwiftUI

struct SearchFormView: View {
    
    @State private var searchText: String = ""
    private var articlesRepository = ArticleRepository()

    var body: some View {
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
        }
    }
    
    
    
    func submit() {
        Task {
            await articlesRepository.findByTitle(title: searchText)
        }
    }
}

struct SearchFormView_Previews: PreviewProvider {
    static var previews: some View {
        SearchFormView().environmentObject(store)
    }
}

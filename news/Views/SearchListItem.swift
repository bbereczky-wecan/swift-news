//
//  SearchListItem.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct SearchListItem: View {
    var article: Article

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
             HStack {
                 Text(article.title ?? "")
                     .font(.headline)
                 Spacer()
             }
            Text(article.description ?? "")
                 .font(.subheadline)
         }
    
    }
}

struct SearchListItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchListItem(article: Article(title: "hello", description: "dude it is a description", sourceName: nil, content: nil, urlToImage: nil, url: nil))
    }
}

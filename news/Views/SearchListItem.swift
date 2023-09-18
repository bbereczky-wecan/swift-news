//
//  SearchListItem.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI
import URLImage

struct SearchListItem: View {
    var article: Article

    var body: some View {
        Link(destination: URL(string: article.url ?? "")!) {
            VStack {
                AsyncImageView(src: article.urlToImage ?? "").scaledToFit()
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Text(article.title ?? "")
                            .font(.headline).foregroundColor(.black)
                        Spacer()
                    }
                    Text(article.description ?? "")
                        .font(.subheadline).foregroundColor(.gray)
                }
            }
        }
    
    }
}

struct SearchListItem_Previews: PreviewProvider {
    static var previews: some View {
        SearchListItem(article: Article(title: "hello", description: "dude it is a description", sourceName: nil, content: nil, urlToImage: "https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png", url: "http://google.com"))
    }
}

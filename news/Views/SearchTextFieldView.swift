//
//  SearchTextFieldView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct SearchTextFieldView: View {
    @State private var searchText: String = ""
    
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
            HStack {
                Text(searchText)
                Spacer()
            }
        }
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}

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
        Form {
            HStack {
                TextField("Search", text: $searchText)
                .padding(10)
                .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                .submitLabel(.search)
                Button(action: submit) {
                    Text("Search").padding(10).background(.blue).fontWeight(.bold).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
          }
        }
    }
    
    func submit() {
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView()
    }
}

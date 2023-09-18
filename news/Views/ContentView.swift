//
//  ContentView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            SearchScreenView(articlesRepository: .init())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
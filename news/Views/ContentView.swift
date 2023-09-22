//
//  ContentView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 12..
//

import SwiftUI

struct ContentView: View {
    

    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 0) {
                    HeaderView()
                    SearchScreenView()
                }.background(Color.formGray)
            }
            LoadingView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        store.auth.setAuthorized(false)
        store.auth.setImageURL("https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png")
        store.auth.setName("Balazs Bereczky")
        return ContentView().environmentObject(store)
    }
}

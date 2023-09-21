//
//  HeaderView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        NavigationLink(destination: LoginScreenView()) {
            HStack {
                Spacer()
                Text("Log in")
                    .padding(.trailing, 30)
                    .foregroundColor(.accentColor)
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

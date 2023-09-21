//
//  LoginScreenView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct LoginScreenView: View {
    var body: some View {
        VStack {
            Text("Log in").padding(.bottom, 40).font(Font.custom( "Pacifico-Regular", size: 40)).bold().foregroundColor(.accentPink)
            GoogleSignInButton()
        }
    }
}

struct LoginScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreenView()
    }
}

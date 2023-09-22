//
//  GoogleSignInButton.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct GoogleSignInButton: View {
    
    private var googleSignInHandler = GoogleSignInHandler()

    var body: some View {
          Button(action: {
              self.googleSignInHandler.signIn()
          }) {
              HStack {
                  Image(systemName: "g.circle.fill")
                      .foregroundColor(.white)
                  Text("Sign in with Google")
                      .foregroundColor(.white)
              }
              .padding()
              .background(Color.googleRed)
              .cornerRadius(8)
          }
      }
}

struct GoogleSignInButton_Previews: PreviewProvider {
    static var previews: some View {
        GoogleSignInButton()
    }
}

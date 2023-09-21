//
//  GoogleSignInButton.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI
import GoogleSignIn
import Firebase

//
//struct GoogleSignInButton: UIViewRepresentable {
//
//    @Environment(\.colorScheme) var colorScheme
//
//    private var button: GIDSignInButton = GIDSignInButton()
//
//    func makeUIView(context: Context) -> GIDSignInButton {
//        button.colorScheme = self.colorScheme == .dark ? .dark : .light
//        return button
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//        button.colorScheme = self.colorScheme == .dark ? .dark : .light
//    }
//}

struct GoogleSignInButton: View {
    func handleGoogleSignIn() {
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: UIApplication.shared.windows.first!.rootViewController!) { result, error in
            guard error == nil else {
                // Handle error
                return
            }

            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                // Handle error
                return
            }

            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)
            
            print(credential)
            // Authenticate with Firebase using the credential
        }
    }
    
    var body: some View {
          Button(action: {
              handleGoogleSignIn()
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

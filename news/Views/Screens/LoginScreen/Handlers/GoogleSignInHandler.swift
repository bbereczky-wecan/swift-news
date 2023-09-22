//
//  GoogleSignInHandler.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation
import GoogleSignIn
import Firebase

class GoogleSignInHandler {
    func signIn() {
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
            print(user.idToken?.tokenString)
            
            print(user.profile?.name)
            print(user.profile?.email)
            let photoURL = user.profile?.imageURL(withDimension: 100)

            print(photoURL)
        }
    }
}

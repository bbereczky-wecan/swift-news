//
//  UserDetailView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 25..
//

import SwiftUI

struct UserDetailView: View {
    
    private var googleSignInHandler = GoogleSignInHandler()
    
    @EnvironmentObject var store: Store

    var body: some View {
        VStack {
            VStack {
                AsyncCircleImageView(src: self.store.auth.imageURL).frame(width: 150, height: 150).padding(.bottom, 50).padding(.top, 50)
                Text(self.store.auth.name).font(.title).foregroundColor(.black).padding(.bottom, 10)
                Text(self.store.auth.email).font(.headline).foregroundColor(.gray)
                Spacer()
            }
            Spacer()
            Button(action: {
                self.googleSignInHandler.signOut()
            }) {
                Text("log out").font(.title2).foregroundColor(.gray)
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        store.auth.setAuthorized(false)
        store.auth.setName("Spider Man")
        store.auth.setEmail("spiderman@spider.web")
        store.auth.setImageURL("https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png")
        return UserDetailView().environmentObject(store)
    }
}

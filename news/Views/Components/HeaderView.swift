//
//  HeaderView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var store: Store
    
    var body: some View {
            HStack {
                Text("News").font(Font.custom( "Pacifico-Regular", size: 40)).foregroundColor(.accentColor)
                Spacer()
                if self.store.auth.authorized {
                    AsyncImageView(src: self.store.auth.imageURL).aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
                } else {
                    NavigationLink(destination: LoginScreenView()) {
                        Text("Log in")
                            .foregroundColor(.accentColor).bold()
                    }
                }
            }.padding().background(
                GeometryReader { geometry in
                    Path { path in
                        path.move(to: CGPoint(x: 0, y: geometry.size.height))
                        path.addLine(to: CGPoint(x: geometry.size.width, y: geometry.size.height))
                    }
                    .stroke(style: StrokeStyle(lineWidth: 3, dash: [5, 3])) 
                    .foregroundColor(.accentColor)
                }
            )
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        store.auth.setAuthorized(false)
        store.auth.setImageURL("https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png")
        return HeaderView().environmentObject(store)
    }
}

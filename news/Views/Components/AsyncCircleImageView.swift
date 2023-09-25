//
//  AsyncCircleImageView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 25..
//

import SwiftUI

struct AsyncCircleImageView: View {
    var src: String
    
    var body: some View {
        AsyncImageView(src: self.src).aspectRatio(contentMode: .fill).clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/).overlay(Circle().stroke(Color.accentColor, lineWidth: 2))
    }
}

#Preview {
    AsyncCircleImageView(src: "https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png")
}

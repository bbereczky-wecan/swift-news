//
//  LoadingView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct LoadingView: View {
    private var isLoading = false

    var body: some View {
        if isLoading { ProgressView("Loading")
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.white)
                .ignoresSafeArea()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}

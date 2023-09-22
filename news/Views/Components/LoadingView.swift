//
//  LoadingView.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import SwiftUI

struct LoadingView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        Group {
            if self.store.isLoading { ProgressView("Loading")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(Color.white)
                    .ignoresSafeArea()
            } else {
                EmptyView()
            }
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        store.startLoading()
        return LoadingView()
            .environmentObject(store)
    }
}

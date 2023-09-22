//
//  Store.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation

class Store: ObservableObject {
    static let instance = Store()
    @Published var isLoading = false
    @Published var articles: [Article] = []
}

let store = Store.instance

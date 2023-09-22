//
//  Store.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation
import Combine

class Store: ObservableObject {
    static let instance = Store()
    @Published var isLoading = false
    @Published var articles: [Article] = []
    var auth: Auth = Auth()
    
    private var cancellables: Set<AnyCancellable> = []

    init() {
        auth.objectWillChange
            .sink { [weak self] _ in
                self?.objectWillChange.send()
            }
            .store(in: &cancellables)
    }
}

let store = Store.instance

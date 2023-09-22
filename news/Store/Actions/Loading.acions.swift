//
//  Loading.acions.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation

extension Store {
    func startLoading() {
        self.isLoading = true
    }
    
    func finishLoading() {
        self.isLoading = false
    }
}

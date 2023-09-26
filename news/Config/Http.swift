//
//  Http.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 26..
//

import Foundation

class Http {
    static func get<T: Decodable>(url: URL, closure: (T) -> Void) async {
        defer {
            DispatchQueue.main.async {
                store.finishLoading()
            }
            
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            await MainActor.run {
                closure(decodedResponse)
            }
        }
        catch {
            print("Something went wrong. \(error)")
        }
    }
}

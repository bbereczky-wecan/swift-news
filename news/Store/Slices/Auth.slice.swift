//
//  Auth.slice.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 22..
//

import Foundation

class Auth: ObservableObject {
    @Published var idToken: String = ""
    @Published var accessToken: String = ""
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var imageURL: String = ""
    @Published var authorized: Bool = false
    
    func setIdToken(_ idToken: String) {
        self.idToken = idToken
    }
    
    func setAccessToken(_ accessToken: String) {
        self.accessToken = accessToken
    }
    
    func setName(_ name: String) {
        self.name = name
    }
    
    func setEmail(_ email: String) {
        self.email = email
    }
    
    func setImageURL(_ imageURL: String) {
        self.imageURL = imageURL
    }
    
    func setAuthorized(_ authorized: Bool) {
        self.authorized = authorized
    }
}

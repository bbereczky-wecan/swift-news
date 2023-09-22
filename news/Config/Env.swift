//
//  Env.swift
//  news
//
//  Created by Balazs Bereczky on 2023. 09. 21..
//

import Foundation

class BaseENV {
    
    let dict: NSDictionary
    
    init() {
        guard let filePath = Bundle.main.path(forResource: "Environment", ofType: "plist"),
            let plist = NSDictionary(contentsOfFile: filePath) else {
            fatalError("could not find Environment.plist")
        }
        
        self.dict = plist
    }
}

protocol APIKeyable {
    var API_KEY: String { get }
    var API_URL: String { get }
}

class EnvironmentClass: BaseENV, APIKeyable {
    var API_KEY: String {
        dict.object(forKey: "API_KEY") as? String ?? ""
    }
    var API_URL: String {
        dict.object(forKey: "API_URL") as? String ?? ""
    }
}


var ENV: APIKeyable {
    return EnvironmentClass()
}

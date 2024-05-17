//
//  UserTokens.swift
//  TODOApiApp
//
//  Created by Vasya Smetankin on 16.05.2024.
//

import Foundation







final class UserTokens: Codable, ObservableObject {
    
    var refresh: String
    var access: String
    
    
    
    init() {
        self.refresh = ""
        self.access = ""
    }
    
    

}

//
//  UserModel.swift
//  TODOApiApp
//
//  Created by Vasya Smetankin on 16.05.2024.
//

import Foundation







final class User: Codable, ObservableObject {

    
    var username: String
    var password: String
    
    
    init() {
        self.username = "cookmem"
        self.password = "Penismusic228"
    }

}

//
//  UserTask.swift
//  IOSClient
//
//  Created by Vasya Smetankin on 17.05.2024.
//

import Foundation



class Task: Codable, Identifiable {
    

    
    
    
    var id: Int
    var title: String
    var description: String?
    var date: String
    var isDone: Bool
    var priority: Int?
    
    
    init(id: Int, title: String, description: String?, date: String, isdone: Bool, priority: Int?) {
        self.id = id
        self.title = title
        self.description = description ?? ""
        self.date = date
        self.isDone = isdone
        self.priority = priority ?? 0
    }
    
    
}

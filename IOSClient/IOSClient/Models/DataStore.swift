//
//  DataStore.swift
//  IOSClient
//
//  Created by Vasya Smetankin on 17.05.2024.
//

import Foundation




class DataStore: ObservableObject {

    @Published var tasks: [Task]
    

    init() {
        self.tasks = []
    }
    
    
    func printStoredTasks() {
        
        
        print("tap")
        
        
        
        for task in tasks {
            
            
            
            print("id: \(task.id), title: \(task.title), desc: \(task.description ?? "nil"), date: \(task.date), isdone: \(task.isDone), priority: \(task.priority ?? 0)")
        }
        
        

    }
    
    

    
}

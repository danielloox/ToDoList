//
//  ContentView.swift
//  IOSClient
//
//  Created by Vasya Smetankin on 17.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    
    
    @StateObject private var networking = NetworkManager()
    @StateObject private var dataStore = DataStore()
    
    
    
    
    var body: some View {
        NavigationStack {
            List {
                
                
                
                // FIX ASYNC FUNC
                ForEach(dataStore.tasks) { task in
                    Text(task.title)
                }
                
                
            }
            .navigationTitle("Tasks")
            .toolbar {
                Image(systemName: "plus.circle")
                    .onTapGesture {
                        networking.printAllData()
                        networking.getTasks { tasks in
                            // FIX ASYNC FUNC // FIX ASYNC FUNC // FIX ASYNC FUNC // FIX ASYNC FUNC // FIX ASYNC FUNC
                            DispatchQueue.main.async {
                                dataStore.tasks = tasks ?? []
                            }
                        }
                    }
            }
            
            
        }
        .onAppear {
            networking.login()
            
        }
        
        

    }
}

#Preview {
    ContentView()
}

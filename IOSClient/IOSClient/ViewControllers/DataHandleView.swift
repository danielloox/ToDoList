//
//  DataHandleView.swift
//  IOSClient
//
//  Created by Vasya Smetankin on 17.05.2024.
//

import SwiftUI

struct DataHandleView: View {
    
    
    @StateObject private var networking = NetworkManager()
    
    
    @StateObject private var dataStore = DataStore()
    
    
    
    var body: some View {
        List {
            Section("networking") {
                Button {
                    networking.printAllData()
                } label: {
                    Text("print all data")
                }
                Button {
                    networking.login()
                } label: {
                    Text("Log in request")
                }
                Button {
                    
                }
            label: {
                Text("get all tasks")
            }
            .disabled(true)
            }
            
            Section("datastore") {
                Button {
                    networking.getTasks { tasks in
                        DispatchQueue.main.async {
                            dataStore.tasks = tasks ?? []
                            
                        }
                    }
                } label: {
                    Text("Get data")
                }
                Button {
                    dataStore.printStoredTasks()
                } label: {
                    Text("Print all stored data")
                }
                
            }
            
            
        }
        
        
        
        HStack {
            VStack(alignment: .leading) {
                Group {
                    Text("User: \(networking.userData.username)")
                    Text("Password: \(networking.userData.password)")
                    HStack {
                        Text("Access token:")
                        ScrollView(.horizontal) {
                            Text(networking.userTokenData.access)
                        }
                    }
                    HStack {
                        Text("Refresh token:")
                        ScrollView(.horizontal) {
                            Text(networking.userTokenData.refresh)
                        }
                    }
                    
                    
                    
                    Text("Data:")
                }
                Spacer()
            }
            Spacer()
        }
        .frame(height: 200)
        
        
        
    }
}

#Preview {
    DataHandleView()
}

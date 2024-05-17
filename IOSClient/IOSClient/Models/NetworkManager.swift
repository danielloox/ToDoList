//
//  NetworkManager.swift
//  TODOApiApp
//
//  Created by Vasya Smetankin on 16.05.2024.
//

import Foundation
import Alamofire



enum UrlRequestType: String {
    case userLogIn = "http://127.0.0.1:8000/api/token/"
    case userTokenRefresh = "http://127.0.0.1:8000/api/token/refresh/"
    case UserGetTasks = "http://127.0.0.1:8000/api/tasks/"
    
}


class NetworkManager: ObservableObject {
    
    
    // should implement that feature soon
    //var connectionIsActive = false
    
    
    @Published var userData = User()
    
    @Published var userTokenData = UserTokens()
    
    
    init() {
        login()
    }
    
    
    
    func login() {
        AF.request(
            UrlRequestType.userLogIn.rawValue,
            method: .post,
            parameters: userData
        ).responseDecodable(of: UserTokens.self) { response in
            
            switch response.result {
            case .success:
                //print("success! user token values are set")
                
                guard let unwrappedResponse = response.value else { return }
                
                self.userTokenData = unwrappedResponse
                
                
                
                //
                
                
            case .failure:
                print("failed to catch user token")
            }
        }
        
        
    }
    
    func getTasks(completion: @escaping ([Task]?) -> Void) {
        
        
        //var responseValue: [Task] = []
        
        
        //
        
        //        let header: HTTPHeaders = [
        //            "Authorization": "Bearer \(userTokenData.access)"
        //        ]
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        AF.request(
            UrlRequestType.UserGetTasks.rawValue,
            method: .get,
            headers: ["Authorization": "Bearer \(userTokenData.access)"]
            
        ).responseDecodable(of: [Task].self, decoder: decoder) { response in
            
            //debugPrint(response)
            
            switch response.result {
            case .success(let tasks):
                completion(tasks)
            case .failure(let error):
                print("Task request failed: \(error)")
                completion(nil)
                
                
                
            }
            
        }
    }
        
        func printAllData() {
            print("=====================CURRENT USER===============================")
            print("User login: \(userData.username)")
            print("User password: \(userData.password)")
            print("=====================CURRENT USER TOKENS========================")
            print("Access token: \(userTokenData.access)")
            print("Refresh token: \(userTokenData.refresh)")
            print("================================================================")
        }
        
        
        
        
    
}

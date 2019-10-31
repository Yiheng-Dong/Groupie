//
//  UserNetworkManager.swift
//  Groupie!
//
//  Created by 沈昊诚 on 2018/12/2.
//  Copyright © 2018年 myl142857. All rights reserved.
//

import Foundation
import Alamofire

class UserNetworkManager {
    
    private static let userURL = "http://35.229.19.136/api/users"
    private static let taskURL = "http://35.229.19.136/api/user/1/task"
    private static let groupURL = "http://35.229.19.136/api/user/1/group"
    private static let taskFromGroupURL = "http://35.229.19.136/api/group/1/task"
    private static let userFromGroupURL = "http://35.229.19.136/api/group/1/user"
    
//    static func createUser(username: String, email: String, completion: @escaping (Int) -> Void) {
//        let parameters: [String:Any] = [
//            "email": email,
//            "username": username
//        ]
//        Alamofire.request(userURL, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: [:]).validate().responseData { (response) in
//            switch response.result {
//            case .success(let data):
//                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
//                    print(json)
//                }
//                let jsonDecoder = JSONDecoder()
//                if let userResponse = try? jsonDecoder.decode(UserResponse.self, from: data) {
//                    completion(userResponse.data.id)
//                } else {
//                    print("Invalid Response Data")
//                }
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    static func getTasks(completion: @escaping ([TaskResponse]) -> Void) {
        Alamofire.request(taskURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let taskResponse = try? jsonDecoder.decode(TaskResponseData.self, from: data) {
                    completion(taskResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGroups(completion: @escaping ([GroupResponse]) -> Void) {
        Alamofire.request(groupURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let groupResponse = try? jsonDecoder.decode(GroupResponseData.self, from: data) {
                    completion(groupResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTasks2(completion: @escaping ([TaskResponse]) -> Void) {
        Alamofire.request(taskFromGroupURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let taskResponse = try? jsonDecoder.decode(TaskResponseData.self, from: data) {
                    completion(taskResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    static func getUsers(completion: @escaping ([User]) -> Void) {
        Alamofire.request(userFromGroupURL, method: .get).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                if let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) {
                    print(json)
                }
                let jsonDecoder = JSONDecoder()
                if let userResponse = try? jsonDecoder.decode(UserResponse.self, from: data) {
                    completion(userResponse.data)
                } else {
                    print("Invalid Response Data")
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

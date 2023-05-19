//
//  fetchFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import Foundation
import Alamofire

/// Fetches all users and puts them in a list of SingleUsers.
/// - Parameter callback: Determined in GetAllUsersView what we want to do with the list of users.
func fetchUsers(  callback: @escaping (_ userList:[SingleUser])->Void){
    AF.request("https://dummyjson.com/users").responseData { response  in
        
        // Guard clause, familiar from js
        guard let data = response.data else {return}
        
        let jsonDecoder = JSONDecoder()
        // Decoding method depends
        let obj = try! jsonDecoder.decode(Users.self, from: data)
        //print(obj)
       
        callback(obj.users)
    }
}

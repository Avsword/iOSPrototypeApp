//
//  searchFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire

/// Searches for a user with a given search parameter
/// - Parameters:
///   - name: What we use as the search parameter. Could be id or age also, but most users search by name.
///   - callback: What do we do with the user that is returned from the request?
/// - Returns: Function doesn't explicitly return anything, but we do use a callback function.
func searchFunction(name:String, callback: @escaping (_ response:SingleUser)->Void){
    AF.request("https://dummyjson.com/users/search?q=\(name)").responseData { data in
        guard let notNull = data.value else {
                return
            }
        if let jsonString = String(data: notNull, encoding: .utf8) {
                   print(jsonString)
        }
               
        let jsonDecoder = JSONDecoder()
        let obj = try! jsonDecoder.decode(Users.self, from: notNull)
        
        if(obj.users.count >= 1){
            callback(obj.users[0])
        }else{
            callback(SingleUser(id: 666, firstName: "User", lastName: "Not found", age: 0, gender: "Male"))
        }
    }
}

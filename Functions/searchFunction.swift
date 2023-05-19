//
//  searchFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire

func searchFunction(name:String, callback: @escaping (_ response:SingleUser)->Void) -> Void {
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

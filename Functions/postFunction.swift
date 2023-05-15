//
//  postFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire
func postFunction(postOrPut:Bool, newPerson: SingleUserPost, callback: @escaping (_ response:String)->Void) -> Void {
    let parameters: [String: Any] = [
        "firstName": newPerson.firstName,
        "lastName": newPerson.lastName,
        "age": newPerson.age,
        "gender": newPerson.gender,
    ]
    
    
    AF.request("https://dummyjson.com/users/add", method: postOrPut ? .post : .put, parameters: parameters, encoding: JSONEncoding.default)
        .responseString { responseDecodable in
            callback(responseDecodable.description)
        }
}

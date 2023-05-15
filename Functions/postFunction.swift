//
//  postFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire
func postFunction(postOrPut:Bool, newPerson: SingleUserPost, id:Int?, callback: @escaping (_ response:String)->Void) -> Void {
    let parameters: [String: Any] = [
        "firstName": newPerson.firstName,
        "lastName": newPerson.lastName,
        "age": newPerson.age,
        "gender": newPerson.gender,
    ]
    
    if(postOrPut){
        AF.request("https://dummyjson.com/users/add", method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .responseString { responseDecodable in
                callback(responseDecodable.description)
            }
    }else{
        if let userid = id {
            AF.request("https://dummyjson.com/users/\(userid)", method: .put  , parameters: parameters, encoding: JSONEncoding.default)
                .responseString { responseDecodable in
                    callback(responseDecodable.description)
                }
        }
        
    }
    
}

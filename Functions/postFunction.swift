//
//  postFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire
/// This function is responsible for handling post and put requests.
/// - Parameters:
///   - postOrPut: If true, post. If false, put.
///   - newPerson: The data we want to post/put.
///   - id: If we update a user, we need their id.
///   - callback: What do we do with the response?
func postOrPutFunction(postOrPut:Bool, newPerson: SingleUserPost, id:Int?, callback: @escaping (_ response:String)->Void){
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

//
//  deleteFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire
/// Deletes  a user based on a given id.
/// - Parameters:
///   - id: ID of the user we want to delete.
///   - callback: What do we want to do with the response of the request?
func deleteFunction(id: Int, callback: @escaping (_ response:String)->Void){
    AF.request("https://dummyjson.com/users/\(id)", method: .delete).responseData {response in
        callback(response.debugDescription)
    }
}

//
//  deleteFunction.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 15.5.2023.
//

import Foundation
import Alamofire
func deleteFunction(id: Int, callback: @escaping (_ response:String)->Void) -> Void {
    AF.request("https://dummyjson.com/users/\(id)", method: .delete).responseData {response in
        callback(response.debugDescription)
    }
}

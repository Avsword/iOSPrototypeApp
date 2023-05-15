//
//  SingleUserStruct.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//


struct Users: Codable {
    var users : [SingleUser]
    
}
struct SingleUser: Codable {
    var id : Int
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
}
struct SingleUserPost: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
}

//
//  SingleUserStruct.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//


/// What most of the requests return. They return an array of users.
struct Users: Codable {
    var users : [SingleUser]
    
}
/// Withing the array of users, these are the values we want to use.
struct SingleUser: Codable {
    var id : Int
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
}
/// For posting a new user we cannot have an ID, so we generate a user for posting.
struct SingleUserPost: Codable {
    var firstName: String
    var lastName: String
    var age: Int
    var gender: String
}

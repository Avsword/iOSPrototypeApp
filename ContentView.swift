//
//  ContentView.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView{
            GetAllUsersView().tabItem{
                Label("Get All", systemImage: "person.3")
            }
            SearchUserView().tabItem{
                Label("Search", systemImage: "magnifyingglass")
            }
            AddUserView().tabItem{
                Label("Add", systemImage: "plus")
            }
            DeleteUserView().tabItem{
                Label("Delete", systemImage: "minus")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  SearchUserView.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import SwiftUI

struct SearchUserView: View {
    @State var userInput:String
    init() {
        _userInput = State(initialValue: "")
    }
    @State var searchResult: SingleUser? = nil
    
    
    var body: some View {
        VStack{
            TextField("Search by name :)", text: $userInput)
            Button("Search"){
                searchFunction(name: userInput){
                    response in
                    print(response)
                    searchResult = response
                }
            }
            if let user = searchResult{
                Spacer()
                HStack{
                    VStack(alignment: .leading){
                        Text(user.firstName)
                        Text(user.lastName)
                    }.frame(width: 90)
                    Spacer()
                    VStack(alignment: .trailing){
                        if (user.gender == "male"){
                            Text("Gender: 🤴")
                        }else{
                            Text("Gender: 👸")
                        }
                        Text(String(user.age))
                    }.frame(width: 100)
                }.frame(maxWidth: .infinity,alignment: .center)
            }
            
        }.padding(50)
            .frame(maxWidth: .infinity,maxHeight: 300, alignment: .center)
        
    }
}

//
//  GetAllUsersView.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import SwiftUI

/// Tab for viewing all of the users in a List format.
struct GetAllUsersView: View {
    @State var 👤: [SingleUser]?
 
    func fetchAllUsers() -> Void {
        fetchUsers(){newList in
            👤 = newList
        }
    }
    @State var showAddOrRemoveAlert:Bool = false
    @State var showNewView:Bool = false
    @State var selectedUser: SingleUserPost = SingleUserPost(firstName: "", lastName: "", age: 0, gender: "")
    @State var selectedID:Int = 0
    init() {
    }
    /// Creates a list item for every user with the name age and gender.
    ///  Should a user be clicked, it'll show an alert to update or delete said user.
    var body: some View {
        List{
            if let userListNotNull = 👤{
                ForEach(userListNotNull, id: \.id){ user in
                    HStack{
                        VStack(alignment: .center){
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
                        Spacer()

                    }.frame(maxWidth: .infinity).onTapGesture {
                        showAddOrRemoveAlert = true
                        selectedUser = SingleUserPost(firstName: user.firstName, lastName: user.lastName, age: user.age, gender: user.gender)
                        selectedID = user.id
                    }
                }
            }
        }
            .scrollContentBackground(.hidden)
            .background(Color.white)
            .onAppear(perform: fetchAllUsers)
            .padding(25)
            .alert(isPresented: $showAddOrRemoveAlert){
                Alert(
                    title: Text("Edit or Delete \(selectedUser.firstName)"),
                    primaryButton: .destructive(
                        Text("Edit"),
                        action: {
                            showNewView=true
                        }
                    ),
                    secondaryButton: .destructive(
                        Text("Delete"),
                        action: {
                            deleteFunction(id: selectedID){response in
                                print(response)
                                👤?.removeAll {
                                    user in
                                    user.id == selectedID
                                }
                            }
                        }
                    )
                )
            }.sheet(isPresented: $showNewView) {
                AddUserView(firstName: selectedUser.firstName, lastName: selectedUser.lastName, age: String(selectedUser.age), gender: selectedUser.gender, postOrPut: false, id:selectedID)
            }
    }
}


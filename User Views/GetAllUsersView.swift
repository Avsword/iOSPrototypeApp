//
//  GetAllUsersView.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import SwiftUI

struct GetAllUsersView: View {
    @State var 👤: [SingleUser]?
 
    func fetchAllUsers() -> Void {
        fetchUsers(){newList in
            👤 = newList
        }
    }
    
    
    var body: some View {
        List{
            if let userListNotNull = 👤{
                ForEach(userListNotNull, id: \.id){ user in
                    HStack{
                        VStack(alignment: .leading){
                            Text(user.firstName)
                            Text(user.lastName)
                        }
                        Spacer()
                        VStack{
                            if (user.gender == "male"){
                                Text("Gender: 🤴")
                            }else{
                                Text("Gender: 👸")
                            }
                            Text(String(user.age))
                        }
                        
                    }
                }
            }
            
        }.onAppear(perform: fetchAllUsers)
            .padding(25)
    }
}
struct GetAllUsersView_Previews: PreviewProvider {
    static var previews: some View {
        GetAllUsersView()
    }
}

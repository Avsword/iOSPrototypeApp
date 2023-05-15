//
//  AddUserView.swift
//  iOSPrototypeApp
//
//  Created by Aaro Varjonen on 8.5.2023.
//

import Foundation
import SwiftUI

struct AddUserView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: String = ""
    
    
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female
        var id: Self { self }
    }

    @State private var selectedGender: Gender = Gender.male
    
    var genderList = ["Male", "Female"]
    
    init(){}
    @State private var tempAge = ""

    @State private var addButtonEnabled:Bool = false
    @State private var showSuccessAlert:Bool = false
    var body: some View {
        VStack{
            TextField("First name", text: $firstName).onChange(of: firstName){new in
                textChanged()
            }
            TextField("Last name", text: $lastName).onChange(of: lastName){new in
                textChanged()
            }
            TextField("Age", text: $tempAge)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .onChange(of: tempAge){ newValue in
                    // 'simpleDigits' is created from a pattern in a string
                    let simpleDigits = try? Regex("[0-9]+")
                    if((try? simpleDigits?.wholeMatch(in: tempAge)) != nil){
                        print("Regex contains only numbers")
                        // We can pretty liberally add the exclamation marks here since the regex makes sure that it contains numbers.
                        if(Int(tempAge)!>0 && Int(tempAge)!<=100){
                            age = newValue
                        }
                    }else{
                        // You can add some clarity here
                    }
                    textChanged()
                }
            Picker("Gender", selection: $selectedGender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }.pickerStyle(.segmented)
            
            Button(action: {
                postFunction(postOrPut:true, newPerson: SingleUserPost(firstName: firstName, lastName: lastName, age: Int(age) ?? 0, gender: selectedGender.rawValue)) { response in
                           print(response)
                           if(response.contains("success")){
                               showSuccessAlert=true
                               firstName=""
                               lastName=""
                               age=""
                           }
                       }
                   }) {
                       Text("Add")
                   }
                   .disabled(!addButtonEnabled)
            Spacer()
            
        }.padding(50).frame(maxWidth: .infinity, alignment: .trailing).alert("New user added successfully!", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
            
    }
     func textChanged() {
        addButtonEnabled = ![firstName, lastName, age].contains { $0.isEmpty }
    }
}


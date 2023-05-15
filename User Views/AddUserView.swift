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
    @State private var tempAge = ""
    
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female
        var id: Self { self }
    }
    @State private var selectedGender: Gender = Gender.male
    var genderList = ["Male", "Female"]
    
    @State var postOrPut:Bool = true
    init(){}
    init(firstName: String = "", lastName: String = "", age: String = "",gender:String, postOrPut:Bool = true, id:Int) {
            _firstName = State(initialValue: firstName)
            _lastName = State(initialValue: lastName)
            _age = State(initialValue: age)
            _tempAge = State(initialValue: age)
            _selectedGender =  State(initialValue: gender == "male" ? Gender.male : Gender.female)
            _postOrPut = State(initialValue: postOrPut)
            _optionalID = State(initialValue: id)
        }
    @State var optionalID:Int?

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
                postFunction(postOrPut:postOrPut, newPerson: SingleUserPost(firstName: firstName, lastName: lastName, age: Int(age) ?? 0, gender: selectedGender.rawValue), id: optionalID) { response in
                           print(response)
                           if(response.contains("success")){
                               showSuccessAlert=true
                               firstName=""
                               lastName=""
                               age=""
                               tempAge=""
                           }
                       }
                   }) {
                       Text("Add")
                   }
                   .disabled(!addButtonEnabled)
            Spacer()
            
        }
            .onAppear(perform: textChanged)
            .padding(50)
            .frame(maxWidth: .infinity, alignment: .trailing)
            .alert(postOrPut ? "New user added successfully!" : "\(firstName) Edited successfully!", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) { }
        }
            
    }
     func textChanged() {
        addButtonEnabled = ![firstName, lastName, age].contains { $0.isEmpty }
    }
}


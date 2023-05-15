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
    @State var gender: String?
    
    enum Gender: String, CaseIterable, Identifiable {
        case male, female
        var id: Self { self }
    }

    @State private var selectedGender: Gender = .male
    
    var genderList = ["Male", "Female"]
    
    init(){}
    @State private var tempAge = ""
    var body: some View {
        VStack{
            TextField("First name", text: $firstName)
            TextField("Last name", text: $lastName)
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
                    }else{
                        print("Other added")
                    }
                }
            Picker("Gender", selection: $selectedGender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }.pickerStyle(.segmented)
            
            Button("Add"){
                print("Added \(age)")
            }
            Spacer()
        }.padding(50).frame(maxWidth: .infinity, alignment: .trailing)
            
    }
}


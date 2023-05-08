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
    
    var body: some View {
        VStack{
            TextField("First name", text: $firstName)
            TextField("Last name", text: $lastName)
            TextField("Age", text: $age)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .onChange(of: age){ newValue in
                    //TODO: ADD VALIDATION
                }
            Picker("Gender", selection: $selectedGender) {
                Text("Male").tag(Gender.male)
                Text("Female").tag(Gender.female)
            }.pickerStyle(.segmented)
            
            Button("Add"){
                print("Added")
            }
            Spacer()
        }.padding(50).frame(maxWidth: .infinity, alignment: .trailing)
            
    }
}


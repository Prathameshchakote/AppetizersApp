//
//  AccountView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusStateField: FormTextField?
    
    enum FormTextField {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationStack{
            
            Form {
                Section("Personal info") {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusStateField, equals: .firstName)
                        .onSubmit { focusStateField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusStateField, equals: .lastName)
                        .onSubmit { focusStateField = .email }
                        .submitLabel(.next)
                    
                    TextField("email", text: $viewModel.user.email)
                        .focused($focusStateField, equals: .email)
                        .onSubmit { focusStateField = nil }
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(false)
                    DatePicker("Date Of Birth",
                               selection: $viewModel.user.dateOfBirth,
                               displayedComponents: .date)
                    
                    Button(action: {
                        viewModel.saveChanges()
                    }, label: {
                        Text("Save Button")
                            .foregroundStyle(Color(.blue))
                    })
                }
                
                Section(header: Text("Requests")) {
                    Toggle("Extra Napkin", isOn: $viewModel.user.extraNapkin)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                    Toggle("Frequent Refills", isOn: $viewModel.user.requentRefills)
                        .toggleStyle(SwitchToggleStyle(tint: .brandPrimary))
                        .foregroundStyle(Color(.blue))
                    
                }
                
            }
            .navigationTitle("Account")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Button("Dismiss") {
                        focusStateField = nil
                    }
                }
            }
        }
        .onAppear(perform: {
            viewModel.retriveUser()
        })
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        })
    }
}

#Preview {
    AccountView()
}

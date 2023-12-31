//
//  AccountViewModel.swift
//  Appetizers
//
//  Created by Prathamesh on 12/21/23.
//

import Foundation
import SwiftUI

class AccountViewModel: ObservableObject {
    @Published var user = User()
    @AppStorage("user") private var userDate: Data?
    @Published var alertItem: AlertItem?
    
    var isValidForm : Bool {
        guard !user.firstName.isEmpty &&  !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        return true
    }
    
    func saveChanges() {
        guard isValidForm else {
            return
        }
        do {
            let data = try JSONEncoder().encode(user)
            userDate = data
            alertItem = AlertContext.userSavedSuccess
        } catch {
            alertItem = AlertContext.userSavedFailed
        }
    }
    
    func retriveUser() {
        guard let data = userDate else {
            return
        }
        
        do {
            let currentUser = try JSONDecoder().decode(User.self, from: data)
            user = currentUser
        } catch {
            alertItem = AlertContext.userSavedFailed
        }
        
    }
    
}

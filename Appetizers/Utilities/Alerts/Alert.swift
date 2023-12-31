//
//  Alert.swift
//  Appetizers
//
//  Created by Prathamesh on 12/19/23.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let inValidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data recived from server is invalid please contact support at support@xyz.com"),
                                       dismissButton: .default(Text("Ok")))
    static let inValidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid responce from Server "),
                                       dismissButton: .default(Text("Ok")))
    static let inValidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("The Url is invalid please contact support at support@xyz.com"),
                                       dismissButton: .default(Text("Ok")))
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Something Happen contact support at support@xyz.com"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidForm = AlertItem(title: Text("Enter non Empty Values for Form"),
                                       message: Text("Enter non Empty Values for Form for name or lastname or email"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid email"),
                                       message: Text("Enter valid email id"),
                                       dismissButton: .default(Text("Ok")))
    
    static let userSavedSuccess = AlertItem(title: Text("Profile Saved"),
                                       message: Text("Saved user succesfully"),
                                       dismissButton: .default(Text("Ok")))
    
    static let userSavedFailed = AlertItem(title: Text("Failed to Saved"),
                                       message: Text("Opps something Happen"),
                                       dismissButton: .default(Text("Ok")))
}

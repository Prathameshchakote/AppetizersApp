//
//  User.swift
//  Appetizers
//
//  Created by Prathamesh on 12/25/23.
//

import Foundation

struct User: Codable {
     var firstName: String = ""
     var lastName: String = ""
     var email: String = ""
     var dateOfBirth = Date()
     var extraNapkin: Bool = false
     var requentRefills: Bool = false
     
}

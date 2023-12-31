//
//  APError.swift
//  Appetizers
//
//  Created by Prathamesh on 12/19/23.
//

import Foundation

enum APError: Error {
    case inValidURL
    case inValidResponse
    case invalidData
    case unableToComplete
}

enum APFormError {
    case inValidValues
    case invalidEmail
}

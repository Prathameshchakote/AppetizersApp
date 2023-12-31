//
//  Appetizer.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import Foundation

struct Appetizer: Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let protein: Int
    let carbs: Int
    let calories: Int
    let imageURL: String
    
}

struct AppetizerResponse: Decodable{
    let request: [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(id: 1,
                                           name: "Pooran Poli",
                                           description: "Gharchi Poli",
                                           price: 1.01,
                                           protein: 22,
                                           carbs: 12,
                                           calories: 32,
                                           imageURL: "")
    
    static let appetizersArray = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderAppetizer = Appetizer(id: 11,
                                           name: "Pooran Poli",
                                           description: "Gharchi Poli",
                                           price: 1.01,
                                           protein: 22,
                                           carbs: 12,
                                           calories: 32,
                                           imageURL: "")
    
    static let orderAppetizer2 = Appetizer(id: 13,
                                           name: "Pooran Poli",
                                           description: "Gharchi Poli",
                                           price: 1.01,
                                           protein: 22,
                                           carbs: 12,
                                           calories: 32,
                                           imageURL: "")
    
    static let orderAppetizer3 = Appetizer(id: 12,
                                           name: "Pooran Poli",
                                           description: "Gharchi Poli",
                                           price: 1.01,
                                           protein: 22,
                                           carbs: 12,
                                           calories: 32,
                                           imageURL: "")
    
    static let orderAppetizerArray = [orderAppetizer,orderAppetizer2,orderAppetizer3]

}

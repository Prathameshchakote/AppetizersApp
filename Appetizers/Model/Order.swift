//
//  Order.swift
//  Appetizers
//
//  Created by Prathamesh on 12/30/23.
//

import Foundation
import SwiftUI

final class Orders: Observable, ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice:Double {
        items.reduce(0) { $0 + $1.price}
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }

    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}


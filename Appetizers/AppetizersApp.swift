//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    var order = Orders()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView().environmentObject(order)
        }
    }
}

//
//  ContentView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Orders

    var body: some View {
        TabView{
            ApptizerListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            AccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("My Account")
                }
            
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Orders")
                }
                .badge(order.items.count)
        }
//        .tint(Color.brandPrimary)
        
    }
}

#Preview {
    AppetizerTabView()
}

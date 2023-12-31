//
//  OrderView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Orders

    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    List {
                        ForEach($order.items) { $apptizer in
                            ApptizerListCell(apptizer: apptizer)
                        }
                        .onDelete(perform: { indexSet in
                            order.remove(at: indexSet)
                        })
                    }
                    .listStyle(PlainListStyle())
                    
                    Button(action: {
                        print(order.items.count)
                    }, label: {
                        APButton(title: "$ \(order.totalPrice ,specifier:"%.2f") plce order")
                    })
                    .background(Color(.green))
                    .padding(.bottom, 30)
                    
                }
                
                if (order.items.isEmpty) {
                    OrderEmptyState(imageName: "EmptyOrder", message: "No Orders Yet Testing long message imageName No Orders Yet")
                }
            }
            .navigationTitle("Order")
        }
        .background(Color(.systemBackground))

    }
}

#Preview {
    OrderView()
}

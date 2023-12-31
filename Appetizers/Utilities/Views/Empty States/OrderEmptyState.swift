//
//  OrderEmptyState.swift
//  Appetizers
//
//  Created by Prathamesh on 12/25/23.
//

import SwiftUI

struct OrderEmptyState: View {
    var imageName: String
    var message: String
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                
                Text(message)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .padding()
            }
            
        }
    }
}

#Preview {
    OrderEmptyState(imageName: "EmptyOrder", message: "No Orders Yet Testing long message imageName No Orders Yet")
}

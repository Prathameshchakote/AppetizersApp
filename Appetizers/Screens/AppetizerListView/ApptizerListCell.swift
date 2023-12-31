//
//  ApptizerListCell.swift
//  Appetizers
//
//  Created by Prathamesh on 12/19/23.
//

import SwiftUI

struct ApptizerListCell: View {
    var apptizer: Appetizer
    var body: some View {
        HStack{
            AppetizerRemoteImage(url: apptizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 120,height: 80)
                .clipShape(.rect)
            VStack(alignment: .leading, spacing: 5) {
                Text (apptizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$ \(apptizer.price ,specifier: "%.2f")")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    ApptizerListCell(apptizer: MockData.sampleAppetizer)
}

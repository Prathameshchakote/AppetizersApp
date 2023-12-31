//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/20/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order: Orders
    
    let apptizer: Appetizer
    @Binding var isShowingDetailView: Bool
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(url: apptizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack{
                Text(apptizer.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                Text(apptizer.description)
                    .multilineTextAlignment(.center)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .frame(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Nutritions()
                    .padding(.top)
                    .frame(maxWidth: .greatestFiniteMagnitude,maxHeight: 60)
            }
            
            Spacer()
            
            Button(action: {
                order.add(apptizer)
                isShowingDetailView = false
            }, label: {
                APButton(title: "$\(apptizer.price ,specifier: "%.2f")   Add to Order")
            })
            .background(Color(.green))
            .padding(.bottom, 30)
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .buttonBorderShape(.roundedRectangle(radius: 12))
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetailView = false
        } label: {
            XDismissButton()
        }, alignment: .topTrailing )
    }
}

#Preview {
    AppetizerDetailView(apptizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}

struct Nutritions: View {
    let apptizer: Appetizer = MockData.sampleAppetizer

    var body: some View {
        HStack(spacing: 30) {
            VStack(alignment: .center) {
                Text("Calories")
                    .font(.title3)
                Text("\(apptizer.calories)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            VStack(alignment: .center) {
                Text("carbs")
                    .font(.title3)
                Text("\(apptizer.carbs)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
            
            VStack(alignment: .center) {
                Text("protein")
                    .font(.title3)
                Text("\(apptizer.protein)")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
                    .italic()
            }
        }
    }
}

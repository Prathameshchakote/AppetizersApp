//
//  LoadingView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/19/23.
//

import Foundation
import SwiftUI

struct ActivityIndicatorView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.color = UIColor.brandPrimary
        indicatorView.startAnimating()
        return indicatorView
        
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {}
        
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            ActivityIndicatorView()
        }
    }
}

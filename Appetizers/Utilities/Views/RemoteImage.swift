//
//  RemoteImage.swift
//  Appetizers
//
//  Created by Prathamesh on 12/20/23.
//

import Foundation
import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image? = nil
    
    func load(fromURLString URLString: String) {
        NetworkManager.shared.downloadImage(fromURLString: URLString) { uiimage in
            guard let uiimage = uiimage else {
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiimage)
            }
        }
    }
}

struct AppetizerRemoteImage: View {
    
    @StateObject var imageLoader = ImageLoader()
    let url: String
    
    var body: some View {
        (imageLoader.image?.resizable() ?? Image("food-placeholder").resizable())
            .onAppear(perform: {
                imageLoader.load(fromURLString: url)
            }) 
    }
}

//
//  ApptizerListViewModel.swift
//  Appetizers
//
//  Created by Prathamesh on 12/19/23.
//

import Foundation

class ApptizerListViewModel: ObservableObject {
    @Published var apptizer: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    @Published var isShowingDetailView = false
    @Published var selectedApptizer: Appetizer?
    
    func getApptizers() {
        isLoading = true
        NetworkManager.shared.getAppetizers { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let appitizers):
                    self.apptizer = appitizers
//                    appitizers.forEach { appetizer in
//                        NetworkManager.shared.downloadImage(fromURLString: appetizer.imageURL) { UIImage? in
//                            <#code#>
//                        }
//                    }
                case .failure(let error):
                    switch error {
                    case .inValidResponse:
                        self.alertItem = AlertContext.inValidResponse
                    case .inValidURL:
                        self.alertItem = AlertContext.inValidURL
                    case .invalidData:
                        self.alertItem = AlertContext.inValidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    }
                    
                    print("error  \(error.localizedDescription)")
                }
            }
        }
    }
}

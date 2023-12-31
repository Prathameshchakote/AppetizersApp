//
//  ApptizerListView.swift
//  Appetizers
//
//  Created by Prathamesh on 12/18/23.
//

import SwiftUI

struct ApptizerListView: View {
    
    @StateObject private var viewModel = ApptizerListViewModel()
//    @State var isShowingDetailView = false
//    @State var selectedApptizer: Appetizer?
    
    var body: some View {
        ZStack {
            NavigationStack{
                List(viewModel.apptizer) { apptizer in
                    ApptizerListCell(apptizer: apptizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            viewModel.isShowingDetailView = true
                            viewModel.selectedApptizer = apptizer
                        }
                }
                .navigationTitle("Apptizer")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetailView)
            }
            
            .onAppear {
                viewModel.getApptizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.isShowingDetailView {
                AppetizerDetailView(apptizer: viewModel.selectedApptizer!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
        }
        .alert(item: $viewModel.alertItem, content: { alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message,
                  dismissButton: alertItem.dismissButton)
        })
    }
    
}

#Preview {
    ApptizerListView()
}

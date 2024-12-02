//
//  AppetizerListView.swift
//  Appetizer
//
//  Created by 61066832 on 22/11/24.
//

import SwiftUI

struct AppetizerListView: View {

    @StateObject private var viewModel = AppetizerViewModel()
    //When initializing the object we use  @StateObject

    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.appetizers) { appetizer in

                    AppetizerCellView(appetizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetailView = true
                        }
                }
                .navigationTitle("Appetizers")
                .disabled(viewModel.isShowingDetailView)
            }
            
//            .onAppear {
//                viewModel.getAppetizers()
//            }
            .task {
                viewModel.getAppertizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20 : 0)
            
            if viewModel.isShowingDetailView{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer ?? MockData.sampleAppetizer, isShowingDetailView: $viewModel.isShowingDetailView)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

#Preview {
    AppetizerListView()
}

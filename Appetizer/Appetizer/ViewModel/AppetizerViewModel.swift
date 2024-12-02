//
//  AppetizerViewModel.swift
//  Appetizer
//
//  Created by 61066832 on 25/11/24.
//

import Foundation

@MainActor final class AppetizerViewModel : ObservableObject {
    @Published var appetizers : [Appetizer] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer : Appetizer?
    
//    func getAppetizers(){
//        isLoading = true
//        NetworkManager.shared.getAppetizer { [self] result in
//            DispatchQueue.main.async {
//                self.isLoading = false
//                switch result{
//                case .success(let appetizers):
//                    self.appetizers = appetizers
//                case .failure(let error):
//                    switch error {
//                    case .invalidData :
//                        self.alertItem = AlertContext.invalidData
//                    case .invalidURLError:
//                        self.alertItem = AlertContext.invalidURL
//                    case .invalidResponse:
//                        self.alertItem = AlertContext.invalidResponse
//                    case .unableToComplete:
//                        self.alertItem = AlertContext.unableToComplete
//                    }
//                }
//            }
//        }
//    }
    func getAppertizers(){
        isLoading = true

        Task{
            do {
                appetizers = try await NetworkManager.shared.getAppetizers()
                isLoading = false
            } catch  {
                isLoading = false
                if let apError = error as? APError{
                    switch apError {
                    case .invalidURLError:
                        alertItem = AlertContext.invalidURL
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                } else{
                    alertItem = AlertContext.genericErrorNetworkCall
                }
            }
        }
    }
}

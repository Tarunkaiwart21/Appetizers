//
//  AccountViewModel.swift
//  Appetizer
//
//  Created by 61066832 on 29/11/24.
//

import SwiftUI

final class AccountViewModel : ObservableObject{
    
    @AppStorage("user") private var userData : Data?
    @Published var user = User()
    @Published var isShowingAlert = false
    @Published var alertItem : AlertItem?
    
    var isValidEmail : Bool {
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidPersonalDetails
            isShowingAlert = true
            return false
        }
        
        guard user.email.isValidEmail else {
            alertItem = AlertContext.invalidEmail
            isShowingAlert = true
            return false
        }
        return true
    }
    
    func saveChanges(){
        guard isValidEmail else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userProfileSaved
            isShowingAlert = true
        } catch {
            alertItem = AlertContext.savingError
            isShowingAlert = true
        }
    }
    
    func retrieveInfo(){
        guard let userData = userData else { return }
        do {
            let decodedUserData = try JSONDecoder().decode(User.self, from: userData)
            user = decodedUserData
        } catch {
            alertItem =  AlertContext.savingError
            isShowingAlert = true
        }
    }
}

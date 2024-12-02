//
//  Alert.swift
//  Appetizer
//
//  Created by 61066832 on 25/11/24.
//

import SwiftUI

struct AlertItem : Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"), message: Text("Data recevied from server is invalid, please try after sometime"), dismissButton: .default(Text("Okay")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"), message: Text("Response recevied from server is invalid, please contact the support team"), dismissButton: .default(Text("Okay")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"), message: Text(" URL trying to connect with server is invalid, please contact the support team"), dismissButton: .default(Text("Okay")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"), message: Text("Unable to complete the request, please try after sometime or check the internet connection"), dismissButton: .default(Text("Okay")))
    
    static let invalidEmail = AlertItem(title: Text("Email Error"), message: Text("Please enter valid email id"), dismissButton: .default(Text("Okay")))
    
    static let invalidPersonalDetails = AlertItem(title: Text("Invalid Persional Details"), message: Text("Please enter the correct details required below"), dismissButton: .default(Text("Okay")))
    
    static let userProfileSaved = AlertItem(title: Text("Details Saved"), message: Text("Provided Information is saved successfully"), dismissButton: .default(Text("Okay")))
    
    static let savingError = AlertItem(title: Text("Error Occured"), message: Text("There was an error while saving or retrieving information"), dismissButton: .default(Text("Okay")))
    
    static let genericErrorNetworkCall = AlertItem(title: Text("Error Occured"), message: Text("There was an error while connecting to server"), dismissButton: .default(Text("Okay")))
}


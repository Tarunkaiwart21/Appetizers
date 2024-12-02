//
//  AccountView.swift
//  Appetizer
//
//  Created by 61066832 on 22/11/24.
//

import SwiftUI
import UIKit

struct AccountView: View {
    
    @StateObject var viewModel = AccountViewModel()
    @FocusState private var focusedTextField: FocusedFieldType?
    
    enum FocusedFieldType {
        case firstName, lastName, email
    }

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                        .autocorrectionDisabled()
                        .focused($focusedTextField, equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .autocorrectionDisabled()
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    TextField("Email", text: $viewModel.user.email)
                        .focused($focusedTextField, equals: nil)
                        .submitLabel(.continue)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled()
            
                    DatePicker("Select Your Birth Day", selection: $viewModel.user.birthday, in: Date().hundredYearsAgo...Date().eighteenYearsAgo, displayedComponents: .date)
                    
                    Button{
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                        
                } header: {
                    Text("Personal Info")
                }
                Section {
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapkins)
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                } header: {
                    Text("Requests")
                }

            }
            
                .navigationTitle("Orders")
                
        }
        .onAppear{
            viewModel.retrieveInfo()
        }
        .alert(isPresented: $viewModel.isShowingAlert) {
            if let alertItem = viewModel.alertItem{
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            } else{
                Alert(title: Text("Something went wrong!"))
            }
        }
    }
}

#Preview {
    AccountView()
}

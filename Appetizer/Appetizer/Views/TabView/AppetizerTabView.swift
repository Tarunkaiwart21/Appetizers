//
//  ContentView.swift
//  Appetizer
//
//  Created by 61066832 on 22/11/24.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order : Order
    var body: some View {
        TabView{
            Tab("Home", systemImage: "house") {
                AppetizerListView()
            }
            Tab("Account", systemImage: "person") {
                AccountView()
            }
            Tab("Order", systemImage: "bag") {
                OrderView()
            }.badge(order.orderItems.count)
            
        }.tint(Color("brandPrimary"))
    }
}

#Preview {
    AppetizerTabView()
}

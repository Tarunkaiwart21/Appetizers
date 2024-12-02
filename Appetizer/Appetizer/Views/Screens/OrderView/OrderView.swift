//
//  OrderView.swift
//  Appetizer
//
//  Created by 61066832 on 22/11/24.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order : Order
    
    var body: some View {
       
        NavigationView {
            ZStack{
                VStack {
                    List{
                        ForEach(order.orderItems) { appetizer in
                            AppetizerCellView(appetizer: appetizer)
                        }.onDelete { indexSet in
                            order.deleteItems(at: indexSet)
                        }
                    }.listStyle(.plain)
                    
                    Button{
                        
                    } label: {
                        APButton(title: "₹\(order.totalAmount, specifier : "%.2f") Place Order")
                    }
                    .padding(.bottom, 25)
                }
                if order.orderItems.isEmpty{
                    EmptyState(imageName: "images", desc: "There is no item in your cart 🫤")
                }
            }
                .navigationTitle("Orders")
        }
    }
}

#Preview {
    OrderView()
}

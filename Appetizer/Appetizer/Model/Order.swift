//
//  Order.swift
//  Appetizer
//
//  Created by 61066832 on 30/11/24.
//

import SwiftUI

final class Order : ObservableObject {
    @Published var orderItems : [Appetizer] = []
    
    var totalAmount : Double {
        orderItems.reduce(0) { $0 + $1.price }
    }
    
    func addOrder(_ appetizer : Appetizer){
        orderItems.append(appetizer)
    }
    
    func deleteItems(at offsets : IndexSet){
        orderItems.remove(atOffsets: offsets)
    }
}

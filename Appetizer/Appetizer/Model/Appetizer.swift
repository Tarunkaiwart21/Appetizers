//
//  Appetizer.swift
//  Appetizer
//
//  Created by 61066832 on 25/11/24.
//

import Foundation

struct Appetizer : Decodable, Identifiable {
    let name : String
    let id : Int
    let description :  String
    let price : Double
    let imageURL :  String
    let calories :  Int
    let protein : Int
    let carbs : Int
}

struct AppetizerResponse : Decodable {
    let request : [Appetizer]
}

struct MockData {
    static let sampleAppetizer = Appetizer(name: "Sample Appetizer",
                                            id: 111,
                                            description: "This is the description section of the Mock Data. It's not healthy for us but we eat for the sake of it",
                                            price: 99.99,
                                            imageURL: "gradient",
                                            calories: 99,
                                            protein: 99,
                                            carbs: 99)
    
    static let appetizers = [orderOne, orderTwo]
    
    static let orderOne = Appetizer(name: "Sample Appetizer",
                                    id: 111,
                                    description: "This is the description section of the Mock Data. It's not healthy for us but we eat for the sake of it",
                                    price: 99.99,
                                    imageURL: "gradient",
                                    calories: 99,
                                    protein: 99,
                                    carbs: 99)
    static let orderTwo = Appetizer(name: "Sample Appetizer",
                                    id: 222,
                                    description: "This is the description section of the Mock Data. It's not healthy for us but we eat for the sake of it",
                                    price: 99.99,
                                    imageURL: "gradient",
                                    calories: 99,
                                    protein: 99,
                                    carbs: 99)
}

//
//  DetailView.swift
//  Appetizer
//
//  Created by 61066832 on 27/11/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    @EnvironmentObject var order : Order
    let appetizer : Appetizer
    @Binding var isShowingDetailView : Bool
    
    var body: some View {
        
        VStack(spacing: 25) {
            
            AppetizerRemoteImage(imageURLString: appetizer.imageURL)
                .aspectRatio(contentMode: .fill)
                .frame(width: 300, height: 275)
            
            VStack(spacing: -10){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                    
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .frame(height: 100)
                
            }

            HStack(spacing : 40){
                NeutritionView(title: "Calories", value: "\(appetizer.calories)")
                NeutritionView(title: "Carbs", value: "\(appetizer.carbs)")
                NeutritionView(title: "Protein", value: "\(appetizer.protein)")
                
            }
            
            Spacer()
            
            Button{
                order.addOrder(appetizer)
                isShowingDetailView = false
            
            }label: {
                APButton(title: "₹ \(appetizer.price, specifier: "%.2f") Add to order")
            }.padding(.bottom, 20)
            Spacer()
            
        }.frame(width: 300, height: 580)
            .background(Color(.systemBackground))
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 40)
            .overlay(Button {
                isShowingDetailView = false
            } label: {
                APDismissButton()
            }, alignment: .topTrailing)

    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
}

struct NeutritionView : View {
    var title : String
    var value : String
    
    var body : some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .fontWeight(.semibold)
            
            Text(value)
                .foregroundStyle(.brandPrimary)
                .fontWeight(.semibold)
        }
    }
}

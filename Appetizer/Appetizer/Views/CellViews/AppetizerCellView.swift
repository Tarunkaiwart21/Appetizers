//
//  AppetizerCellView.swift
//  Appetizer
//
//  Created by 61066832 on 25/11/24.
//

import SwiftUI

struct AppetizerCellView: View {
    let appetizer : Appetizer
    
    var body: some View {
        
        HStack{
            
            AppetizerRemoteImage(imageURLString: appetizer.imageURL)
                .frame(width: 120, height: 120)
                .clipShape(.rect(cornerRadius: 8))
                .aspectRatio(contentMode: .fit)
            //Async Image does not provide "cache" functionality
//            
//            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
//                ImageResizable(image: image)
//                               
//            } placeholder: {
//                ImageResizable(image: Image("download"))
//            }

            
            VStack(alignment: .leading, spacing: 8){
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("₹\(appetizer.price, specifier : "%0.2f")" )
                    .font(.title3)
                    .bold()
                    .foregroundStyle(Color.secondary)
                
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizerCellView(appetizer: MockData.sampleAppetizer)
}


//
//  EmptyState.swift
//  Appetizer
//
//  Created by 61066832 on 30/11/24.
//

import SwiftUI

struct EmptyState: View {
    var imageName : String
    var desc : String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            VStack(spacing : -20){
               
                Image(imageName)
                  
                
                Text(desc)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        }
       
    }
}

#Preview {
    EmptyState(imageName: "images", desc: "Testing to check the multiline text alignment")
}

//
//  APButton.swift
//  Appetizer
//
//  Created by 61066832 on 29/11/24.
//

import SwiftUI

struct APButton: View {
    
    var title :LocalizedStringKey
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .frame(width: 260, height: 50)
            .foregroundStyle(.white)
            .background(Color.brandPrimary)
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    APButton(title: "Test Title")
}

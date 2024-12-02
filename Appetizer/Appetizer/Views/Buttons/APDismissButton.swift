//
//  APDismissButton.swift
//  Appetizer
//
//  Created by 61066832 on 29/11/24.
//

import SwiftUI

struct APDismissButton: View {
        var body: some View {
        ZStack{
            Circle()
                .frame(width: 35, height: 35)
                .foregroundStyle(Color.white)
                .opacity(0.6)
            Image(systemName: "xmark")
                .foregroundStyle(Color.black)
        }
    }
}

#Preview {
    APDismissButton()
}

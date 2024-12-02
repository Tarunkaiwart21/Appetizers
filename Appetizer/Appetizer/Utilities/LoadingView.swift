//
//  LoadingView.swift
//  Appetizer
//
//  Created by 61066832 on 26/11/24.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Color(.systemBackground)
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .brandPrimary))
            .scaleEffect(2)
    }
}

#Preview {
    LoadingView()
}

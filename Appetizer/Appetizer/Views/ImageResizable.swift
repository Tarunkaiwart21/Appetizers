//
//  ImageResizable.swift
//  Appetizer
//
//  Created by 61066832 on 01/12/24.
//

import SwiftUI

struct ImageResizable: View {
    var image : Image
    var body: some View {
        image.resizable()
                .frame(width: 120, height: 120)
                .clipShape(.rect(cornerRadius:10))
                .aspectRatio(contentMode: .fit)
    }
}
#Preview {
    ImageResizable(image: Image("download"))
}

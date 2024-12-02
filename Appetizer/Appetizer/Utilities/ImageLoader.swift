//
//  ImageLoader.swift
//  Appetizer
//
//  Created by 61066832 on 26/11/24.
//

import SwiftUI

final class ImageLoader : ObservableObject {
    @Published var image : Image? = nil
    
    func loadImage(fromURLString urlString: String){
        NetworkManager.shared.downloadImage(fromURLString: urlString) { uiImage in
            guard let uiImage = uiImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}

struct RemoteImage : View {
    var image : Image?
    var body : some View {
        image?.resizable() ?? Image("download").resizable()
    }
}

struct AppetizerRemoteImage : View {
    //@StateObject will observe the change in ImageLoader() object that is broadcasted or @Published by the ImageLoader class.
    @StateObject var imageLoader = ImageLoader()
    let imageURLString : String
    
    var body : some View{
        RemoteImage(image: imageLoader.image)
            .onAppear(){
                imageLoader.loadImage(fromURLString: imageURLString)
            }
    }
}

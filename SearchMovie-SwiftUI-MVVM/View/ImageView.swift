//
//  ImageView.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import SwiftUI

struct ImageView: View {
  let url: String
  @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
  
  init(url: String) {
    self.url = url
    self.imageDownloaderClient.imageDownload(url: self.url)
  }
  
    var body: some View {
      if let data = self.imageDownloaderClient.imageData{
        return Image(uiImage: UIImage(data: data)!)
          .resizable()
          
      }else {
        return Image("placeholder")
          .resizable()
        
          
      }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
      ImageView(url: "").previewLayout(.sizeThatFits)
    }
}

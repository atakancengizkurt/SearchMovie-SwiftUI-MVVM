//
//  ImageDownloaderClient.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import Foundation


class ImageDownloaderClient: ObservableObject{
  
  @Published var imageData : Data?
  
  func imageDownload(url: String){
    guard let imageUrl = URL(string: url) else {
      return
    }
    
    URLSession.shared.dataTask(with: imageUrl) { data, response, error in
      guard let data = data , error == nil else{
        return
      }
      DispatchQueue.main.async {
        self.imageData = data
      }
      
      
    }.resume()
    
  }
}

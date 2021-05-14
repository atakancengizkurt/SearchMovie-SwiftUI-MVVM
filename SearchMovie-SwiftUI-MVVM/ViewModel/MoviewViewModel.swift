//
//  MoviewViewModel.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject{
  
  @Published var movies = [MovieViewModel]()
  
  let downloaderClient = DownloaderClient()
  
  func searchMovie(search: String){
    downloaderClient.searchMovies(search: search) { result in
      switch result{
      case .failure(let error):
        print(error)
      case .success(let movies):
        if let movies = movies{
          DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
          }
          
        }
      }
    }
  }
  
  
}


struct MovieViewModel {
  let movie : Movie
  
  var title: String? {
    movie.title
  }
  
  var year : String? {
    movie.year
  }
  
  var imdbId: String? {
    movie.imdbId
  }
  
  var poster: String? {
    movie.poster
  }
  
}

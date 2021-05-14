//
//  MovieDetailViewModel.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
  @Published var movieDetail: MovieDetailsViewModel?
  
  let downloaderClient = DownloaderClient()
  
  func getMovieDetail(imdbId: String){
    downloaderClient.getMovieDetail(imdbId: imdbId) { result in
      switch result{
      case .failure(let error):
        print(error)
      case .success(let movieDetail):
        if let movieDetail = movieDetail{
          DispatchQueue.main.async {
            self.movieDetail = MovieDetailsViewModel(movieDetail: movieDetail)
          }
        }
      }
    }
  }
}


struct MovieDetailsViewModel {
  let movieDetail : MovieDetail
  
  var title: String? {
    movieDetail.title
  }
  var year: String? {
    movieDetail.year
  }
  
  var actors: String? {
    movieDetail.actors
  }
  
  var awards: String? {
    movieDetail.awards
  }
  
  var plot: String? {
    movieDetail.plot
  }
  
  var genre: String? {
    movieDetail.genre
  }
  
  var imdbRating: String? {
    movieDetail.imdbRating
  }
  
  var poster: String? {
    movieDetail.poster
  }
  
  var imdbId: String? {
    movieDetail.imdbId
  }
  
}

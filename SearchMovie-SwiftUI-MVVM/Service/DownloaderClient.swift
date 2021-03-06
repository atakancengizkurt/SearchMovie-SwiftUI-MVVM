//
//  DownloaderClient.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 13.05.2021.
//

import Foundation

enum DownloaderError: Error{
  case canNotProcessData
  case wrongUrl
  case noDataAvailable
}




class DownloaderClient {
  static let apiKey = "aa971fa3" //You can have your own key for the api with this url: http://www.omdbapi.com/apikey.aspx
  
  func searchMovies(search: String, completion: @escaping(Result<[Movie]?, DownloaderError>) -> Void) {
    guard let url  = URL(string: "http://www.omdbapi.com/?s=\(search)&apikey=\(DownloaderClient.apiKey)") else {
      return completion(.failure(.wrongUrl))
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else{
        return completion(.failure(.noDataAvailable))
      }
      
      guard let moviesResponse = try? JSONDecoder().decode(Movies.self, from: data) else {
        return completion(.failure(.canNotProcessData))
      }
      
      completion(.success(moviesResponse.movies))
    }.resume()
    
  }
  
  
  
  func getMovieDetail(imdbId: String, completion: @escaping (Result<MovieDetail?,DownloaderError>) -> Void) {
    guard let url = URL(string: "http://www.omdbapi.com/?i=\(imdbId)&apikey=\(DownloaderClient.apiKey)") else{
      return completion(.failure(.wrongUrl))
    }
    
    URLSession.shared.dataTask(with: url) { data, response, error in
      guard let data = data, error == nil else{
        return completion(.failure(.noDataAvailable))
      }
      
      guard let movieDetailResponse = try? JSONDecoder().decode(MovieDetail.self, from: data) else {
        return completion(.failure(.canNotProcessData))
      }
      
      completion(.success(movieDetailResponse))
    }.resume()
    
  }
}

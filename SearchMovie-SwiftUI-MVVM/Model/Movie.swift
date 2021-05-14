//
//  Film.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 13.05.2021.
//

import Foundation


struct Movie : Decodable {
  let title: String?
  let year: String?
  let imdbId: String?
  let type: String?
  let poster: String?
  
  private enum CodingKeys: String, CodingKey{
    case title = "Title"
    case year = "Year"
    case imdbId = "imdbID"
    case type = "Type"
    case poster = "Poster"
  }
  
}


struct Movies: Decodable{
  let movies : [Movie]
  
  private enum CodingKeys: String, CodingKey{
    case movies = "Search"
  }
}

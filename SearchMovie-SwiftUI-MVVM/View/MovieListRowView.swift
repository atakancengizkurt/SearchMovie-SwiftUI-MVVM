//
//  MovieListRowView.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import SwiftUI

struct MovieListRowView: View {
  var movie: MovieViewModel
  
    var body: some View {
      HStack{
        ImageView(url: movie.poster ?? "")
          .aspectRatio(contentMode: .fit)
          .frame(width: 100, height: 100, alignment: .center)
        VStack(alignment:.leading){
          Text(movie.title ?? "")
            .foregroundColor(.blue)
            .font(.title)
          Text(movie.year ?? "")
            .bold()
            .foregroundColor(.orange)
        }
      }
    }
}



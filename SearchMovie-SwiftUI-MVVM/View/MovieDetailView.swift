//
//  MovieDetailView.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 14.05.2021.
//

import SwiftUI

struct MovieDetailView: View {
  var imdbId: String
  @ObservedObject var movieDetailViewModel = MovieDetailViewModel()
  var body: some View {
    ScrollView{
      VStack(alignment: .leading){
        HStack{
          Spacer()
          ImageView(url: self.movieDetailViewModel.movieDetail?.poster ?? "")
            .frame(width: UIScreen.main.bounds.width * 0.6, height: UIScreen.main.bounds.height * 0.3, alignment: .center)
          Spacer()
        }
        Group{
        Text("\(movieDetailViewModel.movieDetail?.title ?? "")")
          .font(.largeTitle)
          .bold()
          
        
        Text("Genre: \(self.movieDetailViewModel.movieDetail?.genre ?? "")")
          .font(.subheadline)
          
        
        Text("Actors: \(self.movieDetailViewModel.movieDetail?.actors ?? "")")
          .font(.title3)
          
          
        
        Divider()
   
        Group{
          Text("Plot: \(self.movieDetailViewModel.movieDetail?.plot ?? "")") + Text("Plot: \(self.movieDetailViewModel.movieDetail?.plot ?? "")") + Text("Plot: \(self.movieDetailViewModel.movieDetail?.plot ?? "")") + Text("Plot: \(self.movieDetailViewModel.movieDetail?.plot ?? "")")
          
          
        }
        .font(.body)
        
      }
        .padding()
        .fixedSize(horizontal: false, vertical: true)
        Spacer()
      }
      
    }.onAppear(perform: {
      movieDetailViewModel.getMovieDetail(imdbId: self.imdbId)
    })
    
    
    
    
  }
}

struct MovieDetailView_Previews: PreviewProvider {
  static var previews: some View {
    MovieDetailView(imdbId: "test")
  }
}

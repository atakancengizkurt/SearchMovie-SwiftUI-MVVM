//
//  ContentView.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 13.05.2021.
//

import SwiftUI

struct MovieListView: View {
  @ObservedObject var movieListViewModel: MovieListViewModel
  
  @State var movieName = ""
  
  init() {
    self.movieListViewModel = MovieListViewModel()
    
  }
  
  
  var body: some View {
    NavigationView{
      VStack{
        TextField("Search Movie", text: $movieName) { _ in
        } onCommit: {
          self.movieListViewModel.searchMovie(search: movieName.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? movieName)
        }
        .padding()
        .keyboardType(.webSearch)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        
        
        
        
        if self.movieListViewModel.movies.count > 0{
          List(self.movieListViewModel.movies, id: \.imdbId){
            movie in
            NavigationLink(
              destination: MovieDetailView(imdbId: movie.imdbId ?? ""),
              label: {
                MovieListRowView(movie: movie)
              })
          }
        }else{
          Image("placeholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
        }
        Spacer()
      }.navigationTitle(Text("Search Movie"))
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}

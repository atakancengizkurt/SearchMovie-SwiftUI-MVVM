//
//  ContentView.swift
//  SearchMovie-SwiftUI-MVVM
//
//  Created by Atakan Cengiz KURT on 13.05.2021.
//

import SwiftUI

struct MovieListView: View {
  var body: some View {
    Button(action: {
      DownloaderClient().searchMovies(search: "pulp") { result in
        switch result{
        case .success(let movies):
          print(movies)
        case .failure(let error):
          print(error)
        }
      }
    }, label: {
      Text("Get Data")
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    MovieListView()
  }
}

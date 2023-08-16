//
//  HomeMovieCell.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 16/08/2023.
//

import SwiftUI

struct HomeMoviewCell: View {
    
    @State private var movie: MovieUIModel
    
    init(_ movie: MovieUIModel) {
        self.movie = movie
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: movie.posterPath ?? "")) { img in
                img.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 95, height: 95)
                
            } placeholder: {
                Text("Loading ...")
            }
            VStack(alignment: .leading) {
                Text(movie.title ?? "")
                    .font(.headline)
                Text(movie.overview ?? "")
                    .lineLimit(3)
            }
            Spacer()
        }
    }
}

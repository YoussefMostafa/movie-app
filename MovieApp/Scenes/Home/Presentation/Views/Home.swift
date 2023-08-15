//
//  Home.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import SwiftUI

struct Home: View {

    @ObservedObject private var viewModel = {
        let useCase = HomeUseCase()
        useCase.moviesRepository = MoviesRepository()
        let viewModel = HomeViewModel(useCase: useCase)
        useCase.presenter = viewModel
        return viewModel
    }()
    
    var body: some View {
        NavigationStack {
            List(viewModel.movies) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title ?? "")
                        .font(.headline)
                    Text(movie.overview ?? "")
                }
            }
            .navigationTitle("Inbox")
        }.task {
            viewModel.fetchMovies()
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

//
//  Home.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import SwiftUI

struct Home: View {
    
    /// todod: make the dependency injection in a routing layer
    @StateObject private var viewModel = {
        let useCase = HomeUseCase()
        useCase.moviesRepository = MoviesRepository()
        let viewModel = HomeViewModel(useCase: useCase)
        useCase.presenter = viewModel
        return viewModel
    }()
    
    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .dataLoaded, .idle:
                List(viewModel.movies) { movie in
                    HomeMoviewCell(movie)
                }.navigationTitle("Movies")
            case .error(let errorMessage):
                AlertView(message: errorMessage)
            }
        }
        .task {
            viewModel.fetchMovies()
        }
    }
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

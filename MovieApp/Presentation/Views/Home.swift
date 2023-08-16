//
//  Home.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import SwiftUI

struct Home: View {
    
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
                }.navigationTitle("Movies")
            case .error(let errorMessage):
                VStack {
                    Text("Error")
                        .font(.headline)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text(errorMessage)
                        .font(.caption)
                        .fontWeight(.regular)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                }
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

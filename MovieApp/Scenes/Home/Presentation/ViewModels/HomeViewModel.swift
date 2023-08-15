//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    private let useCase: HomeUseCaseInterface
    var page: Int = 1
    @Published var movies: [MovieUIModel]?
    @Published var isError: Bool = false
    
    init(useCase: HomeUseCase) {
        self.useCase = useCase
    }
    
    func fetchMovies(page: Int) {
        self.page = page
        Task.init {
            useCase.fetchHome(page:)
        }
    }
}

extension HomeViewModel: HomePresenterInterface {
    func didFetchHome(with movies: [MovieDomainModel]?) {
        if self.movies == nil {
            self.movies = []
        }
        if let moviesUIModels = movies?.map({ MovieUIModel(domainModel: $0) }) {
            self.movies?.append(contentsOf: moviesUIModels)
        }
    }
    
    func didFailFetchHome(with error: Error?) {
        isError = true
    }
}

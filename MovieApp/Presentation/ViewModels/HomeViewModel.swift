//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

/// @Published should be migrated to the new SwiftUI @Observable macro
class HomeViewModel: ObservableObject {
    
    private let useCase: HomeUseCaseInterface
    private(set) var page: Int = 0
    @Published var movies: [MovieUIModel] = []
    @Published private(set) var state: ViewState = .idle
    
    init(useCase: HomeUseCaseInterface) {
        self.useCase = useCase
    }
    
    func fetchMovies() {
        page += 1
        state = .loading
        Task.init {
            await useCase.fetchHome(page: page)
        }
    }
}

extension HomeViewModel: HomePresenterInterface {
    func didFetchHome(with movies: [MovieDomainModel]?) {
        if let moviesUIModels = movies?.map({ MovieUIModel(domainModel: $0) }) {
            DispatchQueue.main.async {
                self.state = .dataLoaded
                self.movies.append(contentsOf: moviesUIModels)
            }
        }
    }
    
    func didFailFetchHome(with error: Error?) {
        state = .error(error?.localizedDescription ?? "")
    }
}

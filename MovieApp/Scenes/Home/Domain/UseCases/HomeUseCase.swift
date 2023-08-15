//
//  HomeUseCase.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

class HomeUseCase: HomeUseCaseInterface {
    
    var presenter: HomePresenterInterface?
    var moviesRepository: MoviesRepository?
    
    func fetchHome(page: Int) async {
        do {
            let movies = try await moviesRepository?.fetchHome(page: page)
            presenter?.didFetchHome(with: movies)
        } catch {
            presenter?.didFailFetchHome(with: error)
        }
    }
    
}

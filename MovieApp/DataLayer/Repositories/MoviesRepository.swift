//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

class MoviesRepository: MovieRepositoryInterface {
    func fetchHome(page: Int) async throws -> [MovieDomainModel]? {
        let networkRequest = HomeRequestModel.create(page: page)
        do {
            let homeData: HomeEntity = try await APIManager.shared.call(requestModel: networkRequest)
            let movieDomainModels = homeData.results?.map { MovieDomainModel(entity: $0) }
            return movieDomainModels
        } catch {
            throw error
        }
    }
}

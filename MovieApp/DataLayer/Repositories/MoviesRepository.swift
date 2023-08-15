//
//  MoviesRepository.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

class MoviesRepository: MovieRepositoryInterface {
    func fetchHome(page: Int) async throws -> [MovieEntity]? {
        let networkRequest = HomeRequestModel.create(page: page)
        do {
            let homeData: HomeEntity = try await APIManager.shared.call(requestModel: networkRequest)
            return homeData.results
        } catch {
            throw error
        }
    }
}

//
//  MovieRepositoryInterface.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

protocol MovieRepositoryInterface {
    func fetchHome(page: Int) async throws -> [MovieDomainModel]?
}

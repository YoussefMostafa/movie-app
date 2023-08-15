//
//  HomePresenterInterface.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

protocol HomePresenterInterface {
    func didFetchHome(with movies: [MovieDomainModel]?)
    func didFailFetchHome(with error: Error?)
}

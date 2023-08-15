//
//  MovieEntity.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

struct MovieEntity: Decodable {
    let backdropPath: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let title: String?
}

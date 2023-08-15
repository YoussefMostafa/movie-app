//
//  MovieDomainModel.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

struct MovieDomainModel {
    let id: Int?
    let backdropPath: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let title: String?
    
    init(entity: MovieEntity) {
        backdropPath = entity.backdropPath
        originalTitle = entity.originalTitle
        overview = entity.overview
        posterPath = entity.posterPath
        title = entity.title
        id = entity.id
    }
}

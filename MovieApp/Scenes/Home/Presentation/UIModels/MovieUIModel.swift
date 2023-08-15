//
//  MovieUIModel.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

struct MovieUIModel: Identifiable {
    var id: UUID = UUID()
    let backdropPath: String?
    let originalTitle: String?
    let overview: String?
    let posterPath: String?
    let title: String?
    
    init(domainModel: MovieDomainModel) {
        backdropPath = domainModel.backdropPath
        originalTitle = domainModel.originalTitle
        overview = domainModel.overview
        posterPath = domainModel.posterPath
        title = domainModel.title
    }
}

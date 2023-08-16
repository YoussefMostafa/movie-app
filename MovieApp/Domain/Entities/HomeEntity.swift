//
//  HomeEntity.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

struct HomeEntity: Decodable {
    let page: Int?
    let results: [MovieEntity]?
}

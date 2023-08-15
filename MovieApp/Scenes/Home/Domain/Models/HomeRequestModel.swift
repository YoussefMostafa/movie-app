//
//  HomeRequestModel.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 15/08/2023.
//

import Foundation

struct HomeRequestModel: APIRequestModelInterface {
    var method: HTTPMethod  = .get
    var url: String
    var headers: APIHeaders? = { return createBaseHeaders() }()
    
    init(page: Int) {
        url = "https://api.themoviedb.org/3/discover/movie?include_adult=false&include_video=false&language=en-US&page=\(page)&sort_by=popularity.desc"
    }
    
    static func create(page: Int) -> HomeRequestModel {
        return HomeRequestModel(page: page)
    }
}

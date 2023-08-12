//
//  APIRequestModelInterface.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

protocol APIRequestModelInterface {
    var method: HTTPMethod { get set }
    var url: String { get set }
    var headers: [String : String]? { get set }
}

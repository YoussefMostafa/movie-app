//
//  APIManagerInterface.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

protocol APIManagerInterface {
    func call<T: Decodable>(requestModel: APIRequestModelInterface) async throws -> T
}

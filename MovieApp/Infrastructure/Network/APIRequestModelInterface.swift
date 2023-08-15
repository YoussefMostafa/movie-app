//
//  APIRequestModelInterface.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

protocol APIRequestModelInterface {
    typealias APIHeaders = [String : String]
    
    var method: HTTPMethod { get set }
    var url: String { get set }
    var headers: APIHeaders? { get set }
}

extension APIRequestModelInterface {
    static func  createBaseHeaders() -> APIHeaders? {
        return [
            "Authorization" : "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MDA1MWE2MTU2ZDM5YmRlZDdhZTE2NzFmMWJjMzQ1NyIsInN1YiI6IjU4YjdmNGU4YzNhMzY4MzU4ZDAwNjFhNCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.JiZWPJ-vmSjvbFmv9CwaaHvnVcpMP0zQXrUbWbMWNhM",
            "accept" : "application/json"
        ]
    }
}

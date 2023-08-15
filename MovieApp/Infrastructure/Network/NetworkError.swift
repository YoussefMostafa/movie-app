//
//  NetworkError.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

enum NetworkError: Error {
    case timeOut
    case connectionFailure
    case invalidData
    case invalidUrl
    case invalidResponse(statusCode: Int?)
}

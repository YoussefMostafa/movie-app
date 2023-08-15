//
//  APIManager.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

class APIManager: APIManagerInterface {
    
    static let shared = APIManager()
    
    private init() {}
    
    private let validStatus = 200...299
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return aDecoder
    }()
    
    func call<T: Decodable>(requestModel: APIRequestModelInterface) async throws -> T {
        guard let url = URL(string: requestModel.url) else { throw NetworkError.invalidUrl }
        let urlRequest = createURLReqeust(requestModel: requestModel, url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse, validStatus.contains(response.statusCode) else {
            throw NetworkError.invalidResponse(statusCode: (response as? HTTPURLResponse)?.statusCode)
        }
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkError.invalidData
        }
    }
}

extension APIManager {
    private func createURLReqeust(requestModel: APIRequestModelInterface, url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestModel.method.rawValue
        urlRequest.timeoutInterval = 60.0
        requestModel.headers?.forEach { urlRequest.setValue($0.value, forHTTPHeaderField: $0.key)}
        return urlRequest
    }
}

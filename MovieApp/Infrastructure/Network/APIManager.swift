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
    
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return aDecoder
    }()
    
    func call<T: Decodable>(requestModel: APIRequestModelInterface, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: requestModel.url) else {
            completion(.failure(.invalidUrl))
            return
        }
        let urlRequest = createURLReqeust(requestModel: requestModel, url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            print(response)
            if error == nil {
                if let data = data {
                    if let decodables = try? self.decoder.decode(T.self, from: data) {
                        completion(.success(decodables))
                    }
                } else {
                    completion(.failure(.noData))
                }
            } else {
                completion(.failure(.connectionFailure))
            }
            
        }
        task.resume()
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

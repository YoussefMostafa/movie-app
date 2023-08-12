//
//  APIManager.swift
//  MovieApp
//
//  Created by Youssef Mostafa on 13/08/2023.
//

import Foundation

struct APIManager: APIManagerInterface {
    
    private lazy var decoder: JSONDecoder = {
           let aDecoder = JSONDecoder()
           aDecoder.dateDecodingStrategy = .millisecondsSince1970
           return aDecoder
   }()
    
    func call<T: Decodable>(requestModel: APIRequestModelInterface, completion: @escaping (Result<T, NetworkError>) -> Void) {
        guard let url = URL(string: requestModel.url) else {
            completion(.failure(.invalidUrl))
            return
        }
        let urlRequest = createURLReqeust(requestModel: requestModel, url: url)
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            
        }.resume()
    }
}

     
extension APIManager {
    private func createURLReqeust(requestModel: APIRequestModelInterface, url: URL) -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestModel.method.rawValue
        urlRequest.timeoutInterval = 60.0
        requestModel.headers?.forEach { urlRequest.setValue($0.key, forHTTPHeaderField: $0.value)}
        return urlRequest
    }
}

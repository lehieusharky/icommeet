//
//  CommonAPI.swift
//  ImomeetVision
//
//  Created by Thien Vu on 17/09/2023.
//

import Foundation

enum APIMethod: String {
    case post = "POST"
    case get = "GET"
    case put = "PUT"
    case delete = "DELETE"
}

class CommonAPI: Decodable {
    static func requestAPI(_ url: URL, method: APIMethod = .post, headers: [String: Any]? = nil, parameters: Data? = nil, _ completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        request.httpBody = parameters
        request.timeoutInterval = 10000
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let error = error else {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        if let data = data, data.count > 0 {
                            completion(.success(data))
                        }
                    } else {
                        if let data = data, data.count > 0 {
                            completion(.failure(XpertError(.error_100)))
                        }
                    }
                }
                return
            }
            completion(.failure(error))
        }
        task.resume()
    }
}

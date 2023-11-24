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
    static func requestAPI(_ url: URL, method: APIMethod = .post, headers: [String: String]? = nil, parameters: Data? = nil, _ completion: @escaping (Result<Data, Error>) -> Void) {
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.setValue("\(parameters?.count ?? 0)", forHTTPHeaderField: "Content-Length");
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type");
        
        if let headers = headers {
            for (key, value) in headers {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        
        request.httpBody = parameters
        request.timeoutInterval = 10000
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)

        let task = session.dataTask(with: request) { (data, response, error) in
            guard let error = error else {
                if let response = response as? HTTPURLResponse {
                    if response.statusCode == 200 {
                        if let data = data, data.count > 0 {
                            print("----API-----")
                            if let ret = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
                                let data = try? JSONSerialization.data(withJSONObject: ret, options: .prettyPrinted) {
                                let jsonStr = String(data: data, encoding: .utf8)
                                LogSF.LogTrace("Response: \(jsonStr ?? "")")
                            }
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

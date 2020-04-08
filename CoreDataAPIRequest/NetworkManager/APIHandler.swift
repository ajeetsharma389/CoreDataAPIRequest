//
//  APIHandler.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 06/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}
enum APIHandlerError: Error {
    case noData
    case invalidDataFormat
}

struct Resource {
    let url:URL
    let method:String = "GET"
    let httpHeader: Dictionary<String, String>!
}

extension URLRequest {
    init(_ resource: Resource) {
        self.init(url: resource.url)
        self.httpMethod = resource.method
        self.allHTTPHeaderFields = resource.httpHeader
    }
}
final class APIHandler{
    
    static let sharedInstance = APIHandler()
    
    private init() {}
    func load(_ resource: Resource, result: @escaping ((Result<Data>) -> Void)) {
        let request = URLRequest(resource)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let `data` = data else {
                result(.failure(APIHandlerError.noData))
                return
            }
            if let `error` = error {
                result(.failure(error))
                return
            }
            else if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                if statusCode == 200 {
                    result(.success(data))
                } else {
                    result(.failure(APIHandlerError.invalidDataFormat))
                }
            }
        }
        task.resume()
    }

}



//
//  NetworkManager.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 CG. All rights reserved.
//
import Foundation
final class NetworkManager {
    
    /// Initializer dependency injection
    private let apihandler: APIHandler!
    
    init(handler: APIHandler) {
        self.apihandler = handler
    }
    
    func loadGames(urlString: String,header:  Dictionary <String, String>, completion: @escaping ((Result<GameFeed>) ->Void)) {
        
        let resource = Resource(url: URL(string: urlString)!, httpHeader: header)
        self.apihandler.load(resource) { (result) in
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(GameFeed.self, from: data)
                    DispatchQueue.main.async {
                        completion(.success(items))
                    }
                }catch{
                    completion(.failure(error))
                }
                break
            case .failure(let error):
                completion(.failure(error))
                break
            }
        }
        
    }
}

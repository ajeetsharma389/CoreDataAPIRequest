//
//  NetworkManager.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 CG. All rights reserved.
//
import Foundation
final class NetworkManager {
    
    //    static let sharedInstance = NetworkManager()
    
    //  private init() {}
    
    // Parameter based Dependency injection passing APIHandler into method
    static func loadGamesData(urlString: String,header:  Dictionary <String, String>, apiHandler: APIHandler = .sharedInstance, completion: @escaping ((Result<GameFeed>) ->Void)) {
        
        let resource = Resource(url: URL(string: urlString)!, httpHeader: header)
        apiHandler.load(resource) {  (result) in
            //guard self != nil else {return}
            switch result {
            case .success(let data):
                do {
                    let items = try JSONDecoder().decode(GameFeed.self, from: data)
                    completion(.success(items))
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

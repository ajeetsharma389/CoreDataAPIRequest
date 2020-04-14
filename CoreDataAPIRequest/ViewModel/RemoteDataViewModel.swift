//
//  RemoteDataViewModel.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 13/04/20.
//  Copyright © 2020 Ajeet Kumar Sharma. All rights reserved.
//

import Foundation
protocol onlineDataDelegate {
   func getRemoteData()
}


protocol reloadWithDataTableViewDelegate {
    func reloadTableView(gameFeedObject: GameFeed)
}

final class RemoteDataViewModel {
    private var networkManager: NetworkManager!
    private var reloadWithDataDelegate: reloadWithDataTableViewDelegate?
    private let headers = [
                            "x-rapidapi-host": hostKey,
                            "x-rapidapi-key": apiKey
                          ]
    private let urlString = baseUrl
               
    init(viewDelegate: reloadWithDataTableViewDelegate) {
        reloadWithDataDelegate = viewDelegate
        networkManager = NetworkManager.init(handler: APIHandler.sharedInstance)
    }
    
   private func collectDataFromRemote(competionHandler: @escaping ((Bool, Result<GameFeed>) ->Void)){
        self.networkManager.loadGames(urlString: self.urlString, header: self.headers) { (result) in
            switch result {
            case .success(let returnData):
                print(Thread.current.threadName)
                  competionHandler(true, .success(returnData))
            case .failure( _):
                    break
            }
        }
        
    }
    
}

extension RemoteDataViewModel:onlineDataDelegate {
    func getRemoteData() {
        
        self.collectDataFromRemote { (Bool, result) in
            switch result {
                 case .success(let returnData):
                   // print(returnData)
                    print(Thread.current.threadName)
                    DispatchQueue.main.async {
                        self.reloadWithDataDelegate?.reloadTableView(gameFeedObject: returnData)
                    }
                case .failure( _):
                    print("failure")
            }
        }
    }
    
    
}

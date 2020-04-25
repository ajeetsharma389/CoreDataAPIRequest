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

// Depedency inversion principle
protocol reloadWithDataTableViewDelegate {
    func reloadTableView(gameFeedObject: GameFeed)
}

 final class RemoteDataViewModel {
   // private var networkManager: NetworkManager!
    private var reloadWithDataDelegate: reloadWithDataTableViewDelegate?
    private let headers = [
        "x-rapidapi-host": hostKey,
        "x-rapidapi-key": apiKey
    ]
    // MARK: - Initialization
    init(viewDelegate: reloadWithDataTableViewDelegate) {
        reloadWithDataDelegate = viewDelegate
        //networkManager = NetworkManager.init(handler: APIHandler.sharedInstance)
        //networkManager = NetworkManager.
    }
    
    private func collectDataFromRemote(competionHandler: @escaping ((Bool, Result<GameFeed>) ->Void)){
        
        // Parameter based Dependecy Injection. Passing APIHandler as parameter
        NetworkManager.loadGamesData(urlString: baseUrl,header:  self.headers  , apiHandler: APIHandler.sharedInstance){
            (result) in
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
        
        self.collectDataFromRemote { [weak self] (Bool, result) in
            switch result {
            case .success(let returnData):
                // print(returnData)
                print(Thread.current.threadName)
                DispatchQueue.main.async {
                    self?.reloadWithDataDelegate?.reloadTableView(gameFeedObject: returnData)
                }
            case .failure( _):
                print("failure getRemoteData")
            }
        }
    }
}

//
//  OfflineDataModel.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 02/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation
class OfflineDataModel {
    
    private var items = [Datum]()
    
    init() {
        // When app is working offline
        guard let  jsonFile =  Bundle.main.path(forResource: "GameFeed", ofType: "json") else { return}
               
        guard  let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: .mappedRead) else {return}
        do {
            let gameFeed = try JSONDecoder().decode(GameFeed.self, from: data)
            //self.items = try JSONDecoder().decode(GameFeed.self, from: data)
            self.items = gameFeed.data
            print(gameFeed.data.description)
            
            } catch let error{
                    print(error.localizedDescription)
            }
    }
    
     func exposeItemsToViewModel() ->[Datum]!{
        return items
    }

}

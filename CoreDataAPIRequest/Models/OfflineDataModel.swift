//
//  OfflineDataModel.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 02/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation
class OfflineDataModel {
    
    private var items = [Json4Swift_Base]()
    
    init() {
        // When app is working offline
        guard let  jsonFile =  Bundle.main.path(forResource: "stubs", ofType: "json") else { return}
               
        guard  let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: .mappedRead) else {return}
        do {
            self.items = try JSONDecoder().decode([Json4Swift_Base].self, from: data)
           // print("-----\(items)")
            } catch let error{
                    print(error.localizedDescription)
            }
    }
    
     func exposeItemsToViewModel() ->[Json4Swift_Base]!{
        return items
    }

}

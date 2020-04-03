//
//  OfflineDataViewModel.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 01/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import Foundation

struct OfflineDataViewModel {
    private let offlinedata: OfflineDataModel
    
    init(offlinedataModel: OfflineDataModel) {
        self.offlinedata = offlinedataModel
        
    }
    
     func exposeOfflineDataToView() ->[Json4Swift_Base]{
        return self.offlinedata.exposeItemsToViewModel()
    }
}

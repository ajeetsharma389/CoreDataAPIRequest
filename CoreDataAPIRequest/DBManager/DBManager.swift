//
//  DBManager.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 16/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import UIKit
import CoreData
final class DBManager {
    static let sharedDbManager = DBManager()
    
    private init() {}
    
    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "CoreDataAPIRequest")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

    func fetchDataCount() -> Int{
        var count:Int = 0
        
        let context = persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        
        do {
            let result = try context.fetch(request)
            print("count =\(result.count)")
            count = result.count
            
        } catch {
            print("fetchDataCount data Failed")
        }
        return count
    }
    
    func fetchData() ->[Any]{
        var resultItem = [Any]()
        print("Fetching Data..")
        // clear items
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        let context = persistentContainer.viewContext
        do {
            let result = try context.fetch(request)
            print("count =\(result.count)")
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "newsId") as Any)
                if let newsFullName = data.value(forKey: "full_name") {
                    print(newsFullName)
                    resultItem.append(newsFullName)
                }
            }
            
        } catch {
            print("fetchData data Failed")
        }
        return resultItem
    }
    
    func saveToDB(arrayData: [Datum]) {
        let context = persistentContainer.viewContext
        
        let gameEntity = NSEntityDescription.entity(forEntityName: "Games", in: context)!
        for insertValue in 0..<arrayData.count {
            let games = NSManagedObject(entity: gameEntity, insertInto: context)
            //print("==\(arrayData[insertValue].id as NSNumber)")
            
            games.setValue(NSNumber(value: arrayData[insertValue].id) , forKey: "newsId")
            games.setValue(arrayData[insertValue].homeTeam.fullName , forKey: "full_name")
            games.setValue(arrayData[insertValue].date, forKey: "date")
            games.setValue(arrayData[insertValue].homeTeam.id , forKey: "home_team_id")
            
            // To avoid run time error from coredata due to constraint set on newsId in coredata model to avoid duplicate value
            context.mergePolicy = NSMergePolicy(merge: NSMergePolicyType.mergeByPropertyObjectTrumpMergePolicyType)
            
        }
        saveContext()
    }
}

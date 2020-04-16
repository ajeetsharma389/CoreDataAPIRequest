//
//  SecondViewController.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 CG. All rights reserved.
//

import UIKit
import CoreData
class SecondViewController: UITableViewController {

    var items = [Any]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
   
    override func viewDidAppear(_ animated: Bool){
        
        fetchData()
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if items.count == 0 {
            let rect : CGRect = CGRect(x: self.view.bounds.size.width/2, y: self.view.bounds.size.height/2, width: 100, height: 20)
            let label:UILabel = UILabel.init(frame: rect)
            print(rect)
            label.backgroundColor = UIColor.lightGray
            label.text = "No Record found"
            label.textAlignment = NSTextAlignment.center
            return label
        }
        return nil
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell")!
        cell.textLabel?.text = items[indexPath.row] as? String
        return cell
    }
    func fetchData() {

        print("Fetching Data..")
        // clear items
        self.items.removeAll()
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Games")
        let appDelegate = UIApplication.shared.delegate as! AppDelegate //Singlton instance
        let context = appDelegate.persistentContainer.viewContext
        do {
            let result = try context.fetch(request)
            print("count =\(result.count)")
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "newsId") as Any)
                if let newsFullName = data.value(forKey: "full_name") {
                    print(newsFullName)
                    items.append(newsFullName)
                }
            }

        } catch {
            print("Fetching data Failed")
        }
        
        self.tableView.reloadData()
        print(items)
    }

}


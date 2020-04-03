//
//  FirstViewController.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var newsTableView: UITableView!
    var newsArray = [Json4Swift_Base]()
    var offlineDataviewmodel : OfflineDataViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        // Initializer Dependency injection
        offlineDataviewmodel = OfflineDataViewModel(offlinedataModel: OfflineDataModel())
        
        newsArray = (offlineDataviewmodel?.exposeOfflineDataToView())!
        for value in 0..<newsArray.count {
            print(newsArray[value].newsID!)
        }

    }

    

}

extension FirstViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
        cell.textLabel?.text = newsArray[indexPath.row].symbol
        cell.detailTextLabel?.text = newsArray[indexPath.row].title
        return cell
    }
    
    
    
}

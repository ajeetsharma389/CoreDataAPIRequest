//
//  FirstViewController.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,reloadWithDataTableViewDelegate {
    
    // Delegate from ViewModel
    func reloadTableView(gameFeedObject: GameFeed) {
        print(Thread.current.threadName)
            print(Thread.current.threadName)
            //extract Datum from gameFeedObject
            self.newsArray = gameFeedObject.data
            self.newsTableView.reloadData()
    }
    
    
    

    

    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var OnOffLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var toggleButton: UISwitch!
    var newsArray = [Datum]()
    var offlineDataviewmodel : OfflineDataViewModel?
    var remoteDataModel: RemoteDataViewModel?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView.isHidden = false
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        switchToOfflne(toggleButton)
    }
    @IBAction func switchToOfflne(_ sender: UISwitch) {
        
        if !sender.isOn {
            
            loaderView.isHidden = false
            // OFFLINE MODE
            self.OnOffLabel.text = "OffLine"
            // Initializer Dependency injection. Get data from ViewModel
            offlineDataviewmodel = OfflineDataViewModel(offlinedataModel: OfflineDataModel())
            newsArray = (offlineDataviewmodel?.exposeOfflineDataToView())!
            newsTableView.reloadData()
            loaderView.isHidden = true
            
        }
        else {
            self.OnOffLabel.text = "OnLine"
            self.loaderView.isHidden = false
            newsArray.removeAll()
            //Get data from ViewModel
            remoteDataModel = RemoteDataViewModel(viewDelegate: self)
            self.remoteDataModel?.getRemoteData()
        }
    }
    

}

extension FirstViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "firstCell", for: indexPath)
        
        cell.textLabel?.text = newsArray[indexPath.row].homeTeam.fullName
        return cell
    }
    
    
}


extension Thread {

    var threadName: String {
        if let currentOperationQueue = OperationQueue.current?.name {
            return "OperationQueue: \(currentOperationQueue)"
        } else if let underlyingDispatchQueue = OperationQueue.current?.underlyingQueue?.label {
            return "DispatchQueue: \(underlyingDispatchQueue)"
        } else {
            let name = __dispatch_queue_get_label(nil)
            return String(cString: name, encoding: .utf8) ?? Thread.current.description
        }
    }
}

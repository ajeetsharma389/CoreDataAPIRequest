//
//  FirstViewController.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var loaderView: UIActivityIndicatorView!
    @IBOutlet weak var OnOffLabel: UILabel!
    @IBOutlet weak var newsTableView: UITableView!
    @IBOutlet weak var toggleButton: UISwitch!
    var newsArray = [Datum]()
    var offlineDataviewmodel : OfflineDataViewModel?
    var networkManager: NetworkManager!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        loaderView.isHidden = false
        newsTableView.delegate = self
        newsTableView.dataSource = self
        newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        
        networkManager = NetworkManager.init(handler: APIHandler.sharedInstance)
        switchToOfflne(toggleButton)
    }
    @IBAction func switchToOfflne(_ sender: UISwitch) {
        
        if !sender.isOn {
            
            loaderView.isHidden = false
            // OFFLINE MODE
            self.OnOffLabel.text = "OffLine"
            // Initializer Dependency injection
            offlineDataviewmodel = OfflineDataViewModel(offlinedataModel: OfflineDataModel())
            newsArray = (offlineDataviewmodel?.exposeOfflineDataToView())!
            newsTableView.reloadData()
            loaderView.isHidden = true
            
        }
        else {
            self.OnOffLabel.text = "OnLine"
            self.loaderView.isHidden = false
            newsArray.removeAll()
              let headers = [
                  "x-rapidapi-host": "free-nba.p.rapidapi.com",
                  "x-rapidapi-key": "1IdsadERvTmshoQlSIgJ8ESwyssMp16CArAjsn83B1TPNgFee0"
              ]
              let urlString = "https://free-nba.p.rapidapi.com/games?page=0&per_page=14"
              
            self.networkManager?.loadGames(urlString: urlString, header: headers, completion: { (result) in
                switch result {
                case .success(let returnData):
                        DispatchQueue.main.async {
                            //print(returnData)
                            self.newsArray = returnData.data
                            self.newsTableView.reloadData()
                            self.loaderView.isHidden = true
                        }
                        break
                case .failure( _):
                        break
                }
            })
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

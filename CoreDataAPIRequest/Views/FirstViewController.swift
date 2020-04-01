//
//  FirstViewController.swift
//  CoreDataAPIRequest
//
//  Created by Ajeet on 30/03/20.
//  Copyright © 2020 . All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // When app is working offline
        guard let  jsonFile =  Bundle.main.path(forResource: "stubs", ofType: "json") else { return}
        
        //let jsonDataFile = Data(c)
        guard  let data = try? Data(contentsOf: URL(fileURLWithPath: jsonFile), options: .mappedRead) else {return}


                        do {
                            let people = try JSONDecoder().decode([Json4Swift_Base].self, from: data)
                            print(people)
                        } catch let error{
                            print(error.localizedDescription)
                        }

    }


}


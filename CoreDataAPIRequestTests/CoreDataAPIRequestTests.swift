//
//  CoreDataAPIRequestTests.swift
//  CoreDataAPIRequestTests
//
//  Created by Ajeet on 17/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import XCTest
@testable import CoreDataAPIRequest
class CoreDataAPIRequestTests: XCTestCase {

    var firstController: FirstViewController?
    let dbManagaer = DBManager.sharedDbManager
    override func setUp() {
        
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        firstController = storyBoard.instantiateViewController(identifier: "first")
        guard firstController != nil else {
                   return XCTFail("Could not instantiate ViewController from main storyboard")
        }
        firstController?.newsArrayFromDB = dbManagaer.fetchData()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        firstController = nil
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testControllerHasTableView() {
       
        firstController?.loadViewIfNeeded()
        XCTAssertNotNil(firstController?.newsTableView, "Controller should have a tableview")

    }
    
    func testNumberOfRows() {
        firstController?.loadViewIfNeeded()
        let numberOfRows = firstController?.newsTableView.numberOfRows(inSection: 0)
        let rowCount = firstController?.newsArrayFromDB.count
        XCTAssertEqual(numberOfRows, rowCount,
                       "Number of rows in table should match number of dbrow")
    }

    func testTableViewHasCell() {
        firstController?.loadViewIfNeeded()
        let cell = firstController?.newsTableView.dequeueReusableCell(withIdentifier: "firstCell")
        
        XCTAssertNotNil(cell, "TableView should be able to dequeue cell with identifier: 'firstCell'")
    }
    
    func testCellForRow() {
        firstController?.loadViewIfNeeded()
        firstController?.newsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "firstCell")
        let cell = firstController?.newsTableView.dequeueReusableCell(withIdentifier: "firstCell")
      //  XCTAssertEqual(cell?.textLabel?.text, != "",
                   //    "The first cell should display name of first kitten")
    }

//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        measure {
//            // Put the code you want to measure the time of here.
//        }
//    }

}

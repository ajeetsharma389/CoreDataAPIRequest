//
//  APIHandlerTests.swift
//  CoreDataAPIRequestTests
//
//  Created by Ajeet on 17/04/20.
//  Copyright © 2020 CG. All rights reserved.
//

import XCTest
@testable import CoreDataAPIRequest

class APIHandlerTests: XCTestCase {
    var networkManager: NetworkManager!

    override func setUp() {
        
        //networkManager = NetworkManager.init(handler: APIHandler.sharedInstance)
        // Create a URL (using the file path API to avoid optionals)
       // let filePath = Bundle.main.path(forResource: "GamesFeed", ofType: "json")
        guard let  filePath =  Bundle.main.path(forResource: "GameFeed", ofType: "json") else { return}
        let url = URL(fileURLWithPath: baseUrl)

        let data = Data(bytes: [0, 1, 0, 1])
         let resource = Resource(url: url, httpHeader: nil)
        // Perform the request and verify the result
         // waitForExpectations(timeout: 5) { (error) in
         // XCTAssertNotNil(moviesResponse)
        //}
       
       // XCTAssertEqual(result, .success(data))
       // XCTAssertEqual(result, .success(data))
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
//        let headers = [
//                        "x-rapidapi-host": hostKey,
//                        "x-rapidapi-key": apiKey
//                      ]
//               var result:Result<GameFeed>?
//               let expectationFromAPI = expectation(description: "movies")
//               let moviesResponse: [GameFeed]?
//
//               networkManager.loadGames(urlString: baseUrl, header: headers) { (result) in
//
//                    switch result{
//                        case .success (let returnData):
//
//                                expectationFromAPI.fulfill()
//                        case .failure(_):
//                                XCTFail("Failed")
//
//                    }
//               }
//        waitForExpectations(timeout: 15) { (error) in
//          XCTAssertNotNil(expectationFromAPI)
        //}
        //wait(for: [expectationFromAPI], timeout: 5)
             
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
    }

}

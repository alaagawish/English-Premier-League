//
//  NetworkTest.swift
//  English Premier LeagueTests
//
//  Created by Alaa on 20/04/2024.
//

import XCTest
@testable import English_Premier_League

final class NetworkTest: XCTestCase {

    var network: NetworkProtocol!
      override func setUpWithError() throws {
          // Put setup code here. This method is called before the invocation of each test method in the class.
          network = Network()
      }
      
      override func tearDownWithError() throws {
          // Put teardown code here. This method is called after the invocation of each test method in the class.
          network = nil
          
      }
      
      func testGetAllMatches(){
          let myExpectation = expectation(description: "waiting network")
          network.getAllMatches(path: "v2/competitions/2021/matches") { response in
              
              
              guard let response = response else{
                  XCTFail()
                  myExpectation.fulfill()
                  return
              }
         
              XCTAssertEqual(response.count, 380)
              myExpectation.fulfill()
          }
          
          waitForExpectations(timeout: 10)
          
      }
      
  }

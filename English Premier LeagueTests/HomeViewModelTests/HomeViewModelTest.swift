//
//  HomeViewModelTest.swift
//  English Premier LeagueTests
//
//  Created by Alaa on 20/04/2024.
//

import XCTest
@testable import English_Premier_League

final class HomeViewModelTest: XCTestCase {
    
    var repo: RepoProtocol!
    var homeViewModel: HomeViewModel!
    let match: Matches = Matches(id: 2, season: nil, utcDate: "", status: "", matchday: 3, stage: "", lastUpdated: "", odds: nil, score: nil , homeTeam: nil, awayTeam: nil, referees: [])
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        repo = Repo(network: NetworkMockTest(isSuccess: true), database: DatabaseMock())
        homeViewModel = HomeViewModel(repositiory: repo)
        
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        repo = nil
        homeViewModel = nil
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetAllMatches() {
        let result = homeViewModel.getAllMatches()
        XCTAssertNotNil(result)
        
    }
    
    func testCheckItemInFav( ) {
        homeViewModel.addToFav(match)
        let result = homeViewModel.checkItemInFav(match)
        XCTAssertTrue(result)
        
    }
    
    func testAddToFav() {
        homeViewModel.addToFav(match)
        let result = homeViewModel.checkItemInFav(match)
        XCTAssertTrue(result)
    }
    
    func testRemoveFromFav() {
        homeViewModel.addToFav(match)
        homeViewModel.removeFromFav(match)
        let result = homeViewModel.checkItemInFav(match)
        XCTAssertFalse(result)
    }
    
    func testGetAllFavMatches() {
        homeViewModel.addToFav(match)
        homeViewModel.addToFav(match)
        let result = homeViewModel.getAllFavMatches()
        
        XCTAssertNotNil(result)
    }
    
    
}

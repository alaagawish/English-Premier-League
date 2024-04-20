//
//  NetworkMockTest.swift
//  English Premier LeagueTests
//
//  Created by Alaa on 20/04/2024.
//

import Foundation
@testable import English_Premier_League

class NetworkMockTest: NetworkProtocol {
    
    var isSuccess: Bool!
    init(isSuccess: Bool!) {
        self.isSuccess = isSuccess
    }
    let response: MatchResponse = MatchResponse(count: 2, filters: Filters(), competition: Competition(id: 0, area: Area(id: 0, name: ""), name: "", code: "", plan: "", lastUpdated: ""), matches: [Matches(id: 0, season: nil, utcDate: "", status: "", matchday: 0, stage: "", lastUpdated: "", odds: nil, score: nil, homeTeam: nil, awayTeam: nil, referees: [])])
    
    func getAllMatches(path: String, handler: @escaping (English_Premier_League.MatchResponse?) -> Void) {
        if isSuccess {
            handler(response)
        } else {
            handler(nil)
        }
    }
}

//
//  Matches.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Matches: Codable {

    let id: Int?
    let season: Season?
    let utcDate: String?
    let status: String?
    let matchday: Int?
    let stage: String?
//    let group: Any?
    let lastUpdated: String?
    let odds: Odds?
    let score: Score?
    let homeTeam: HomeTeam?
    let awayTeam: AwayTeam?
    let referees: [Referees]?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case season = "season"
        case utcDate = "utcDate"
        case status = "status"
        case matchday = "matchday"
        case stage = "stage"
//        case group = "group"
        case lastUpdated = "lastUpdated"
        case odds = "odds"
        case score = "score"
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
        case referees = "referees"
    }

}

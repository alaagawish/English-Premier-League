//
//  MatchResponse.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct MatchResponse: Codable {

    let count: Int
    let filters: Filters
    let competition: Competition
    let matches: [Matches]

    private enum CodingKeys: String, CodingKey {
        case count = "count"
        case filters = "filters"
        case competition = "competition"
        case matches = "matches"
    }

}

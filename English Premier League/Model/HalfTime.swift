//
//  HalfTime.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct HalfTime: Codable {

    let homeTeam: Int?
    let awayTeam: Int?

    private enum CodingKeys: String, CodingKey {
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
    }

}

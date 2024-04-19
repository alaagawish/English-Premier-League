//
//  Penalties.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Penalties: Codable {

    let homeTeam: Any
    let awayTeam: Any

    private enum CodingKeys: String, CodingKey {
        case homeTeam = "homeTeam"
        case awayTeam = "awayTeam"
    }

}

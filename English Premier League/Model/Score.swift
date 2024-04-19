//
//  Score.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Score: Codable {

    let winner: String
    let duration: String
    let fullTime: FullTime
    let halfTime: HalfTime
    let extraTime: ExtraTime
    let penalties: Penalties

    private enum CodingKeys: String, CodingKey {
        case winner = "winner"
        case duration = "duration"
        case fullTime = "fullTime"
        case halfTime = "halfTime"
        case extraTime = "extraTime"
        case penalties = "penalties"
    }

}

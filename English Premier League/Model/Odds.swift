//
//  Odds.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Odds: Codable {

    let msg: String

    private enum CodingKeys: String, CodingKey {
        case msg = "msg"
    }

}

//
//  Referees.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Referees: Codable {

    let id: Int
    let name: String
    let role: String
    let nationality: String

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case role = "role"
        case nationality = "nationality"
    }

}

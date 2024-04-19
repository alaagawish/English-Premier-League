//
//  Competition.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Competition: Codable {

    let id: Int?
    let area: Area?
    let name: String?
    let code: String?
    let plan: String?
    let lastUpdated: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case area = "area"
        case name = "name"
        case code = "code"
        case plan = "plan"
        case lastUpdated = "lastUpdated"
    }

}

//
//  Area.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Area: Codable {

    let id: Int?
    let name: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }

}

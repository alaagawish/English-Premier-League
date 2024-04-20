//
//  Season.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

struct Season: Codable {

    let id: Int?
    let startDate: String?
    let endDate: String?
    let currentMatchday: Int?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case startDate = "startDate"
        case endDate = "endDate"
        case currentMatchday = "currentMatchday"
    }

}

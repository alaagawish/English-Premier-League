//
//  DatabaseProtocol.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation
import CoreData

protocol DatabaseProtocol {
    func addMatchToFav(match: FavMatch)
    func removeMatchFromFav(match: FavMatch)
    func getAllMatches() -> [FavMatch]
    func searchFor(match: FavMatch) -> Bool
    
}

//
//  DatabaseMocl.swift
//  English Premier LeagueTests
//
//  Created by Alaa on 20/04/2024.
//

import Foundation
@testable import English_Premier_League

class DatabaseMock: DatabaseProtocol {
    
    var matches: [LocalMatch] = []
    func addMatchToFav(match: English_Premier_League.LocalMatch) {
        matches.append(match)
    }
    
    func removeMatchFromFav(match: English_Premier_League.LocalMatch) {
        var index: Int = 0
        for i in 0..<matches.count {
            if matches[i].id == match.id {
                index = i
                break
            }
        }
        matches.remove(at: index)
    }
    
    func getAllMatches() -> [English_Premier_League.FavMatch] {
        var newMatches: [FavMatch] = []
//        for _ in matches {
//            newMatches.append(FavMatch())
//        }
        return []
    }
    
    func searchFor(match: English_Premier_League.LocalMatch) -> Bool {
        var index: Int = -1
        for i in 0..<matches.count {
            if matches[i].id == match.id {
                index = i
                break
            }
        }
        if index > -1 {
            return true
        }
        return false
    }
    
    
}

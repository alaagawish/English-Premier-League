//
//  Repo.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

class Repo: RepoProtocol {
    let network: NetworkProtocol!
    let database: DatabaseProtocol!
    init(network: NetworkProtocol!, database: DatabaseProtocol!) {
        self.network = network
        self.database = database
    }
    func getAllMatches(path: String, handler: @escaping (MatchResponse?) -> Void) {
        network.getAllMatches(path: path, handler: handler)
    }
    
    func addMatchToFav(match: LocalMatch) {
        database.addMatchToFav(match: match)
    }
    
    func removeMatchFromFav(match: LocalMatch) {
        database.removeMatchFromFav(match: match)
    }
    
    func getAllMatches() -> [FavMatch] {
        return database.getAllMatches()
    }
    
    func searchFor(match: LocalMatch) -> Bool {
        return database.searchFor(match: match)
    }
    
    
}

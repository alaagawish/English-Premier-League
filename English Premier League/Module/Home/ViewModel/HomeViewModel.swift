//
//  HomeViewModel.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

class HomeViewModel {
    var repositiory: RepoProtocol
    
    var matches: MatchResponse? {
        didSet {
            bindMatchesToVC()
        }
    }
    var bindMatchesToVC: (()->()) = {}
    init(repositiory: RepoProtocol) {
        self.repositiory = repositiory
    }
    
    func getAllMatches() {
        repositiory.getAllMatches(path: "v2/competitions/2021/matches") { [weak self] matches in
            
            guard let self = self else { return }
            self.matches = matches
        }
    }
    
    func checkItemInFav(_ match: Matches) -> Bool {
        var m :LocalMatch
        
        if match.status == "FINISHED" {
            
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult:  "\(match.score?.fullTime?.homeTeam ?? 0):\(match.score?.fullTime?.awayTeam ?? 0)")
        } else {
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult: match.utcDate)
            
        }
        
        return repositiory.searchFor(match: m)
    }
    
    func addToFav(_ match: Matches) {
        var m :LocalMatch
        if match.status == "FINISHED" {
            
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult:  "\(match.score?.fullTime?.homeTeam ?? 0):\(match.score?.fullTime?.awayTeam ?? 0)")
        } else {
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult: match.utcDate)
            
        }
        repositiory.addMatchToFav(match: m)
    }
    
    func removeFromFav(_ match: Matches) {
        var m :LocalMatch
        if match.status == "FINISHED" {
            
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult:  "\(match.score?.fullTime?.homeTeam ?? 0):\(match.score?.fullTime?.awayTeam ?? 0)")
        } else {
            m = LocalMatch(homeTeam: match.homeTeam?.name, awayTeam: match.awayTeam?.name, status: match.status, id: Int64(match.id ?? 0), timeResult: match.utcDate)
            
        }
        repositiory.removeMatchFromFav(match: m)
    }
}

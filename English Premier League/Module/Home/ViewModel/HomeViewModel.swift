//
//  HomeViewModel.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation

class HomeViewModel {
    var network: NetworkProtocol
    var matches: MatchResponse? {
        didSet {
            bindMatchesToVC()
        }
    }
    var bindMatchesToVC: (()->()) = {}
    init(network: NetworkProtocol) {
        self.network = network
    }
    
    func getAllMatches() {
        network.getAllMatches(path: "v2/competitions/2021/matches") { [weak self] matches in
            
            guard let self = self else { return }
            self.matches = matches
        }
    }
}

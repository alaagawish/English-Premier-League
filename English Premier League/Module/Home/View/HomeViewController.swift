//
//  HomeViewController.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var gamesTableView: UITableView!
    var homeViewModel: HomeViewModel!
    var matches: [Matches]?
    var days: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeViewModel = HomeViewModel(network: Network())
        configurateCell()
        
        homeViewModel.getAllMatches()
        
        homeViewModel.bindMatchesToVC = { [weak self] in
            guard let self = self else { return }
            self.matches = self.homeViewModel.matches?.matches
            self.getDays()
            
        }
    }
    func getDays() {
        for i in matches ?? [] {
            days.append(i.utcDate ?? "")
        }
        
        gamesTableView.reloadData()
    }
    
    func configurateCell() {
        let nib = UINib(nibName: Constants.GameTableViewCell, bundle: nil)
        gamesTableView.register(nib, forCellReuseIdentifier: Constants.GameTableViewCellID)
    }
    
    
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.GameTableViewCellID, for: indexPath) as! GameTableViewCell
        
        if matches?[indexPath.row].status == "FINISHED" {
            cell.addFinishedGame(homeTeam: matches?[indexPath.row].homeTeam?.name ?? "", awayTeam: matches?[indexPath.row].awayTeam?.name ?? "", time: "\(matches?[indexPath.row].score?.fullTime?.homeTeam ?? 0):\(matches?[indexPath.row].score?.fullTime?.awayTeam ?? 0)", fave: false)
        } else {
            cell.addScheduledGame(homeTeam: matches?[indexPath.row].homeTeam?.name ?? "", awayTeam: matches?[indexPath.row].awayTeam?.name ?? "", time: matches?[indexPath.row].utcDate ?? "", fave: true)
        }
        cell.indexPath = indexPath
        cell.addToFavDelegate = self
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}
extension HomeViewController: AddToFavDelegate {
    func addGameToFav(indexPath: IndexPath) {
       
    }
    
    
}

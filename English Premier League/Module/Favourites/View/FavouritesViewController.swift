//
//  FavouritesViewController.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    var homeViewModel: HomeViewModel!
    var matches: [LocalMatch] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurateCell()
        homeViewModel = HomeViewModel(repositiory: Repo(network: Network(), database: Database()))
    }
    
     
     func configurateCell() {
         let nib = UINib(nibName: Constants.GameTableViewCell, bundle: nil)
         favTableView.register(nib, forCellReuseIdentifier: Constants.GameTableViewCellID)
     }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        matches = homeViewModel.getAllFavMatches()
        favTableView.reloadData()
    }
}

extension FavouritesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.GameTableViewCellID, for: indexPath) as! GameTableViewCell
        
        if matches[indexPath.row].status == "FINISHED" {
            cell.addFinishedGame(homeTeam: matches[indexPath.row].homeTeam ?? "", awayTeam: matches[indexPath.row].awayTeam ?? "", time: matches[indexPath.row].timeResult ?? "", fave: true)
        } else {
            cell.addScheduledGame(homeTeam: matches[indexPath.row].homeTeam ?? "", awayTeam: matches[indexPath.row].awayTeam ?? "", time: matches[indexPath.row].timeResult ?? "", fave: true)
        }
        cell.indexPath = indexPath
        cell.addToFavDelegate = self
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
}

extension FavouritesViewController: AddToFavDelegate {
    func addGameToFav(indexPath: IndexPath, status: String) {
        homeViewModel.removeFromFav(m: matches[indexPath.row])
        
        matches.remove(at: indexPath.row)
        favTableView.reloadData()
    }
    
    
}

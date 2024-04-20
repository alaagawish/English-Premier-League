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
    var activityIndicator: UIActivityIndicatorView!
    var matches: [Matches]?
    var days: [String] = []
    var sections: [[Matches]] = []
    var flag: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        showActivityIndicator()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            self.hideActivityIndicator()
            self.scrollToTodaySection()
            
        }
        homeViewModel = HomeViewModel(repositiory: Repo(network: Network(), database: Database()))
        configurateCell()
        
        
    }
    
    func scrollToTodaySection() {
        let today =  Date()
        
        for i in 0 ..< sections.count {
            
            if sections[i].firstIndex(where: {Functions().convertUTCToYYYYMMDD(utcDate:  $0.utcDate ?? "") ?? "" == Functions().formatDateToString(date: today, format: "yyyy-MM-dd")}) != nil {
                
                let indexPath = IndexPath(row: 0, section: i)
                
                
                gamesTableView.scrollToRow(at: indexPath, at: .top, animated: true)
            }
        }
    }
    
    func configurateCell() {
        let nib = UINib(nibName: Constants.GameTableViewCell, bundle: nil)
        gamesTableView.register(nib, forCellReuseIdentifier: Constants.GameTableViewCellID)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        homeViewModel.getAllMatches()
        
        homeViewModel.bindMatchesToVC = { [weak self] in
            guard let self = self else { return }
            self.matches = self.homeViewModel.matches?.matches
            self.calculateNumberOfSections()
            
        }
        scrollToTodaySection()
    }
    func setupActivityIndicator() {
        activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    func showActivityIndicator() {
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
        scrollToTodaySection()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sections.count > 0 {
            return Functions().convertUTCToYYYYMMDD(utcDate: sections[section][0].utcDate ?? "")
        } else {
            return ""
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.GameTableViewCellID, for: indexPath) as! GameTableViewCell
        
        if sections[indexPath.section][indexPath.row].status == Constants.FINISHED {
            cell.addFinishedGame(
                homeTeam: sections[indexPath.section][indexPath.row].homeTeam?.name ?? "",
                awayTeam: sections[indexPath.section][indexPath.row].awayTeam?.name ?? "",
                time: "\(sections[indexPath.section][indexPath.row].score?.fullTime?.homeTeam ?? 0):\(sections[indexPath.section][indexPath.row].score?.fullTime?.awayTeam ?? 0)",
                fave: homeViewModel.checkItemInFav(sections[indexPath.section][indexPath.row]))
        } else {
            cell.addScheduledGame(
                homeTeam: sections[indexPath.section][indexPath.row].homeTeam?.name ?? "",
                awayTeam: sections[indexPath.section][indexPath.row].awayTeam?.name ?? "",
                time: Functions().convertUTCToHHMM(utcDate: sections[indexPath.section][indexPath.row].utcDate ?? "") ?? "",
                fave: homeViewModel.checkItemInFav(sections[indexPath.section][indexPath.row]))
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
    
    func addGameToFav(indexPath: IndexPath, status: String)   {
        if status == Constants.fillHeart {
            self.homeViewModel.removeFromFav((self.matches?[indexPath.row])!)
            //            let alert : UIAlertController = UIAlertController(title: "Delete from favourites", message: "ARE YOU SURE TO DELETE?", preferredStyle: .alert)
            //
            //            alert.addAction(UIAlertAction(title: "YES", style: .default,handler: { [weak self] action in
            //                guard let self = self else { return }
            //                self.homeViewModel.removeFromFav((self.matches?[indexPath.row])!)
            //                self.flag = false
            //
            //
            //            }))
            //            alert.addAction(UIAlertAction(title: "NO", style: .cancel,handler: nil))
            //            self.present(alert, animated: true, completion: nil)
            //            return flag
        } else {
            homeViewModel.addToFav(matches![indexPath.row])
            
        }
    }
    
}


extension HomeViewController {
    
    
    func calculateNumberOfSections() {
        sections = []
        matches?.forEach(
            { match in
                let matchDate = Functions().convertUTCToYYYYMMDD(utcDate: match.utcDate ?? "")
                
                if let sectionIndex = sections.firstIndex(where: { Functions().convertUTCToYYYYMMDD(utcDate: $0.first?.utcDate ?? "") == matchDate }) {
                    sections[sectionIndex].append(match)
                } else {
                    sections.append([match])
                }
                
            })
        gamesTableView.reloadData()
        
        
    }
    
}

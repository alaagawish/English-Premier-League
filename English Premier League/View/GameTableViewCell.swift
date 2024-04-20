//
//  GameTableViewCell.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import UIKit

class GameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var addToFavButton: UIButton!
    @IBOutlet weak var gameResultLabel: UILabel!
    @IBOutlet weak var awayTeamLabel: UILabel!
    @IBOutlet weak var homeTeamLabel: UILabel!
    @IBOutlet weak var gameStatusLabel: UILabel!
    var indexPath: IndexPath!
    var addToFavDelegate: AddToFavDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func addScheduledGame(homeTeam: String, awayTeam: String, time: String, fave: Bool) {
        gameStatusLabel.text = "Scheduled"
        homeTeamLabel.text = homeTeam
        awayTeamLabel.text = awayTeam
        gameResultLabel.text = time
        gameStatusLabel.textColor = UIColor(named: "green")
        checkButton(fave: fave)
    }
    
    @IBAction func addItemToFav(_ sender: Any) {
        if addToFavButton.image(for: .normal) == UIImage(systemName: "heart") {
            
            addToFavDelegate.addGameToFav(indexPath: indexPath, status: "heart")
            checkButton(fave: true)
        } else {
            
            addToFavDelegate.addGameToFav(indexPath: indexPath, status: "heart.fill")
            checkButton(fave: false)
        }
    }
    func addFinishedGame(homeTeam: String, awayTeam: String, time: String, fave: Bool) {
        gameStatusLabel.text = "Finished"
        homeTeamLabel.text = homeTeam
        awayTeamLabel.text = awayTeam
        gameResultLabel.text = time
        gameStatusLabel.textColor = UIColor(named: "red")
        checkButton(fave: fave)
    }
    func checkButton(fave: Bool) {
        if fave {
            addToFavButton.setImage(UIImage(systemName:  "heart.fill"), for: .normal)
        } else {
            addToFavButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
}

extension Constants {
    static let GameTableViewCell = "GameTableViewCell"
    static let GameTableViewCellID = "GameTableViewCellID"
}

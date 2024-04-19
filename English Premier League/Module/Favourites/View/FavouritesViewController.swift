//
//  FavouritesViewController.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import UIKit

class FavouritesViewController: UIViewController {

    @IBOutlet weak var favTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        configurateCell()
     }
     
     func configurateCell() {
         let nib = UINib(nibName: Constants.GameTableViewCell, bundle: nil)
         favTableView.register(nib, forCellReuseIdentifier: Constants.GameTableViewCellID)
     }

   
}

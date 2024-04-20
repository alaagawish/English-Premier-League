//
//  Database.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation
import CoreData
import UIKit

class Database: DatabaseProtocol {
    
    var managedContext: NSManagedObjectContext
    init(){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        managedContext = appDelegate.persistentContainer.viewContext
    }
    
    func addMatchToFav(match: FavMatch) {
        let entity = NSEntityDescription.entity(forEntityName: Constants.EntityName, in: managedContext)
        let league = NSManagedObject(entity: entity!, insertInto: managedContext)
        league.setValue(match.away_team, forKey: Constants.awayTeam)
        league.setValue(match.home_team, forKey: Constants.homeTeam)
        league.setValue(match.id, forKey: Constants.id)
        league.setValue(match.status, forKey: Constants.status)
        league.setValue(match.time_result, forKey: Constants.timeResult)
        do{
            try managedContext.save()
            print("\nInserting a match done...\n")
        }catch let error as NSError{
            print("\nerror in adding to favourite: \(error)\n")
        }
    }
    
    func removeMatchFromFav(match: FavMatch) {
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: Constants.EntityName)
        
        let myPredicate = NSPredicate(format: "id == %d", match.id)
        fetchRequest.predicate = myPredicate
        do{
            let leagues = try managedContext.fetch(fetchRequest)
            print(leagues.count)
            if leagues.count > 0{
                managedContext.delete(leagues[0])
                try managedContext.save()
                print("\nDelete league done...\n")
            }
        }catch let error as NSError{
            print("\nerror in deleteting a league : \(error)\n")
        }
        
    }
    
    func getAllMatches() -> [FavMatch] {
        
        let fetchRequest = NSFetchRequest<FavMatch>(entityName: Constants.EntityName)
        
        do {
            
            let requests = try managedContext.fetch(fetchRequest)
            
            return requests
            
        } catch let fetchErr {
            print("Failed to fetch requests:",fetchErr)
        }
        return []
    }
    
    func searchFor(match: FavMatch) -> Bool {
        let fetchRequest = NSFetchRequest<FavMatch>(entityName: Constants.EntityName)
        fetchRequest.predicate = NSPredicate(format: "id == %", match.id)
        
        do {
            let fetchedItems = try managedContext.fetch(fetchRequest)
            return !fetchedItems.isEmpty
        } catch {
            print("Error fetching data or not existing match: \(error)")
            return false
        }
    }
    
    
    
}

extension Constants {
    static let EntityName = "FavMatch"
    static let awayTeam = "away_team"
    static let homeTeam = "home_team"
    static let id = "id"
    static let status = "status"
    static let timeResult = "time_result"
}

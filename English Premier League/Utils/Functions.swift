//
//  Functions.swift
//  English Premier League
//
//  Created by Alaa on 20/04/2024.
//

import Foundation

class Functions {
    
    func convertUTCToYYYYMMDD(utcDate: String) -> String? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        guard let date = dateFormatter.date(from: utcDate) else {
            return nil
        }
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let yyyyMMddString = dateFormatter.string(from: date)
        
        return yyyyMMddString
    }
    
    func convertUTCToHHMM(utcDate: String) -> String? {
        let dateFormatter = DateFormatter()
           dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
           dateFormatter.timeZone = TimeZone(identifier: "UTC")
 
           guard let date = dateFormatter.date(from: utcDate) else {
               return nil
           }
 
           dateFormatter.dateFormat = "hh:mm a"
           let hhmmAString = dateFormatter.string(from: date)
           
           return hhmmAString
    }
    
    func convertUTCToDate(utcDate: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
         
        if let date = dateFormatter.date(from: utcDate) {
            return date
        } else {
            return nil 
        }
    }
    
    func formatDateToString(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: date)
    }


}

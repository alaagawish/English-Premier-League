//
//  NetworkProtocol.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation
import Alamofire

protocol NetworkProtocol {
    func getAllMatches(path: String, handler: @escaping (MatchResponse?) -> Void) 
}

//
//  Network.swift
//  English Premier League
//
//  Created by Alaa on 19/04/2024.
//

import Foundation
import Alamofire


class Network: NetworkProtocol {
    let headers: HTTPHeaders = [
        "X-Auth-Token" : "e228752f29e542c0a874b497095fd4da"
    ]
    
    func getAllMatches(path: String, handler: @escaping (MatchResponse?) -> Void) {
        AF.request("\(Constants.URL)\(path)",
                   method: .get,
                   headers: headers
        ).responseDecodable(of: MatchResponse.self) { response in
            switch response.result {
            case .success(let data):
                handler(data)
            case .failure(let error):
                print("Error in Matches response: \(error)")
            }
        }
        
    }
}

//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQABgaJjQYth868HU8TclzY4CevaCkCc4MooraJC_x_yqyekHpF-4xfWMQsCSH2f1a8rr7jtJ9iOWQ3_tk81udRLQGehxfTvc2t5vr8MEZY_NaRhiZpnRiLJmkZmevS_hAtCamlw61b-yJMTBYExtHmEDYpZievkcWo5nkI4KHhLiKMfIvdGFA"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data?{
        do{
            var request = URLRequest(url:HelperString.getURLFromString(url: "\(BASE_URL)\(url)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        }catch{
            return nil
        }
    }
    
}


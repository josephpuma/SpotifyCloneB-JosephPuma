//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQB2Fcbbj2ZDXwjv6LGnvSctVqxHAtuRbjg90ysazXPnoQBKav_9LkxNs_7IhUdVHe4TOKH7T9H33NmeN2fEKKUHZZc_UDfI9oO_K905RzXwlyUznxpKhMMDL8CxBXsL6nLvL6UlLEZOPDLqtXT7U_ABdZ1odgOPG4XD9S2J2u_lYLBkSjjUyg"
    
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


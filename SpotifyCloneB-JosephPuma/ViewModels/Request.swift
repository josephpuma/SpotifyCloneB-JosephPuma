//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQDoV2SZLa_5p78f0-mkwjgwG_oZN972QrcBAcXCmSN0ooeGhaYBViF5CqapNPslCSkHFCXnnmt6Up9f4ySFdNSgeo1af8kgH_T4cYLo-bvfW6mpTLvqiSJx0DSYkExOPleta7JYoV5VlhFiQ_vQAbHgLzAF3JxjhfM"
    
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


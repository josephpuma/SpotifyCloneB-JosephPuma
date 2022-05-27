//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQD-3ilzWp4pBaCd7rp8Tq0hIzfbWujywdlNlDpBKIPfpujphWeVUI0zAqjgRbiGRfrV7dJFg0RYXrmILP2A1TMs5PmqjOivv4_kziJdC9quyGi8ZccztwH_fBh2XRExTVKchGEBCgs1MB-OMtK17m4vyMa-0jOzG0Rxnw7W4xvmmy_vZsi2DQ"
    
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


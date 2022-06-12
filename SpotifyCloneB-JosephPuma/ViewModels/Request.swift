//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQD5p-y8NYJ2TbQxbnYvyBB4tVpWUBT3XecYxeYVyyBvdJ10HmAKk7yFf4nB2xtSgAGTM_1sOXeq937DsP29jy5nGO00wmAyUqIOFA1I6F3y0n2D29ydl6VZ806l1klOogpmRzfgwr6FcC_MPamkZkNnSZF1k5mvzSubnHdnA1x7k2NzBm0K0I7tE2SKpK9IXrjh4kStCF4v4-FDVSI9_P0RYLk"
    
    let BASE_URL = "https://api.spotify.com/v1/"
    
    func getDataFromAPI(url: String) async -> Data?{
        do{
            
            let parseURL = url.replacingOccurrences(of: " ", with: "%20")
                .replacingOccurrences(of: "ñ", with: "n")
                .replacingOccurrences(of: "Ñ", with: "n")
                .replacingOccurrences(of: "á", with: "a")
                .replacingOccurrences(of: "é", with: "e")
                .replacingOccurrences(of: "í", with: "i")
                .replacingOccurrences(of: "ó", with: "o")
                .replacingOccurrences(of: "ú", with: "u")
                .replacingOccurrences(of: "Á", with: "a")
                .replacingOccurrences(of: "É", with: "e")
                .replacingOccurrences(of: "Í", with: "i")
                .replacingOccurrences(of: "Ó", with: "o")
                .replacingOccurrences(of: "Ú", with: "u")
            
            var request = URLRequest(url:HelperString.getURLFromString(url: "\(BASE_URL)\(parseURL)")!)
            request.httpMethod = "GET"
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        }catch{
            return nil
        }
    }
    
}


//
//  Request.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation

class Request {
    
    let token = "BQAUXvdmSd137O_u_PC8SqkUf-YIlr12tJYbU_y4Y5_WHUji1cMQwe76O_Bx7xZHd7Pz4e6mEJsroThdM1bdHVGmbiFUsu6sfiLKXfk_7bfVuMfAswctr562Rrl3paOYOq5yLRlejdr5sARF3v_B0DoEaavSbxQhliiLLt1kZeDszYOK9pt9Sw"
    
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


//
//  Spotify+String.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by MAC32 on 20/05/22.
//

import Foundation


class HelperString {
    
    static let imageProfileLink = "https://i.scdn.co/image/ab6775700000ee85606a4837d6cc12c5969288c0"
    
    static func getURLFromString(url: String) -> URL? {
        guard let url = URL(string: url) else { return nil }
        
        return url
    }
}


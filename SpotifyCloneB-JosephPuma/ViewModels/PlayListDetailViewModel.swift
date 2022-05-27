//
//  PlayListDetailViewModel.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Cconislla Puma on 26/05/22.
//

import Foundation

class PlayListDetailViewModel {
    let request: Request = Request()
    
    var playlistDetail : PlaylistDetail? = nil
    
    func getPlaylistDetail(id: String) async{
        let data = await request.getDataFromAPI(url: "users/31d7pnolcduc5hhiqkbiv4ceiv34/playlists/\(id)")
        
        if data != nil {
            if let decoder = try? JSONDecoder().decode(PlaylistDetail.self, from: data!){
                DispatchQueue.main.async(execute: {
                    self.playlistDetail = decoder
                })
            }
        }
        
    }
    
}

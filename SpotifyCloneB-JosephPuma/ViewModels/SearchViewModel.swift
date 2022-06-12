//
//  SearchViewModel.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Puma on 12/06/2022.
//

import Foundation

class SearchViewModel {
    
    let request: Request = Request()
    
    var searchResult: TracksSearch? = nil
    
    func getMusicsByName(name: String) async -> TracksSearch? {
        
        guard let data = await request.getDataFromAPI(url: "search?q=\(name)&type=track&limit=10") else {return nil}
        
        if let decoder = try? JSONDecoder().decode(SearchList.self, from: data){
            DispatchQueue.main.async(execute: {
                self.searchResult = decoder.tracks
            })
        }
        
        return searchResult
        
    }
    
}

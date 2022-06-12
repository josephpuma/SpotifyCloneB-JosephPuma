//
//  Search.swift
//  SpotifyCloneB-JosephPuma
//
//  Created by Joseph Puma on 12/06/2022.
//

import Foundation

struct SearchList: Codable {
    let tracks: TracksSearch
}

struct TracksSearch: Codable {
    let href: String
    let items: [ItemSearch]
}

struct ItemSearch: Codable {
    let album: AlbumSearch
}

struct AlbumSearch: Codable {
    let artists: [Artists]
    let images: [Image]
    let name: String
}

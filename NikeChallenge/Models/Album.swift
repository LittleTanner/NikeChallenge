//
//  Album.swift
//  NikeChallenge
//
//  Created by Kevin Tanner on 2/5/20.
//  Copyright © 2020 Kevin Tanner. All rights reserved.
//

import Foundation

// Top Level
struct TopLevelDict: Codable {
    let feed: Results
}

// 2nd Level
struct Results: Codable {
    let results: [Album]
}

// 3rd Level
struct Album: Codable {
    enum CodingKeys: String, CodingKey {
        case albumCoverArt = "artworkUrl100"
        case albumName = "name"
        case artist = "artistName"
        case genres
        case releaseDate
        case copyrightInfo = "copyright"
        case albumURL = "url"
    }
    
    let albumCoverArt: String
    let albumName: String
    let artist: String
    let genres: [Genre]
    let releaseDate: String
    let copyrightInfo: String
    let albumURL: String
}

// 4th Level
struct Genre: Codable {
    enum CodingKeys: String, CodingKey {
        case genre = "name"
    }
    let genre: String
}

//
//  Song.swift
//  JSONOne
//
//  Created by 林祔利 on 2023/4/19.
//

import Foundation

struct Song: Codable {
    let resultCount: Int
    let results: [inner]

}

struct inner: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl100: URL?
    let releaseDate: Date
}

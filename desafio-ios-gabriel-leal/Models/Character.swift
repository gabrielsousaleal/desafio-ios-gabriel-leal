//
//  Character.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

// MARK: - Character
struct CharactersResult: Decodable {
    let code: Int
    let status, copyright, attributionText, attributionHTML: String
    let etag: String
    let data: CharactersDataClass
}

// MARK: - DataClass
struct CharactersDataClass: Decodable {
    let offset, limit, total, count: Int
    let characters: [Character]
    
    private enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case limit = "limit"
        case total = "total"
        case count = "count"
        case characters = "results"
    }
}

// MARK: - Result
struct Character: Decodable {
    let id: Int
    let name, resultDescription: String
    let modified: Date
    let thumbnail: Thumbnail
    let resourceURI: String
    let comics, series: Comics
    let stories: Stories
    let events: Comics
    let urls: [URLElement]

    enum CodingKeys: String, CodingKey {
        case id, name
        case resultDescription = "description"
        case modified, thumbnail, resourceURI, comics, series, stories, events, urls
    }
}

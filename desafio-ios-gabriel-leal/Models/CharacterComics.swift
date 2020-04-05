//
//  CharacterComics.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

// MARK: - Comics
struct CharacterComics: Decodable{
    let code: Int?
    let status, copyright, attributionText, attributionHTML: String?
    let etag: String?
    let data: CharacterComicsDataClass?
}

// MARK: - DataClass
struct CharacterComicsDataClass: Decodable {
    let offset: Int?
    let limit: Int?
    let total: Int?
    let count: Int?
    let results: [CharacterComicsResult]?
}

// MARK: - Result
struct CharacterComicsResult: Decodable {
    let id, digitalID: Int?
    let title: String?
    let variantDescription, description: String?
    let resourceURI: String?
    let prices: [Price]?
    let thumbnail: Thumbnail?
    let images: [Thumbnail]?
}

// MARK: - Price
struct Price: Codable {
    let type: String?
    let price: Double?
}

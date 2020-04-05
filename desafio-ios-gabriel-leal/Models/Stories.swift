//
//  Stories.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

// MARK: - Stories
struct Stories: Decodable {
    let available: Int?
    let collectionURI: String?
    let items: [StoriesItem]?
    let returned: Int?
}

// MARK: - StoriesItem
struct StoriesItem: Decodable {
    let resourceURI: String?
    let name: String?
    let type: String?
}

//
//  URL.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

// MARK: - URLElement
struct URLElement: Decodable {
    let type: String?
    let url: String?
}

 enum URLType: String, Decodable {
    case comiclink = "comiclink"
    case detail = "detail"
    case wiki = "wiki"
}

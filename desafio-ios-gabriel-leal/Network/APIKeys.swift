//
//  APIKeys.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation
import CryptoSwift

struct ParamKeys {
    static let apikey = "apikey"
    static let hash = "hash"
    static let timeStamp = "ts"
    static let limit = "limit"
    static let offset = "offset"
    static let searchName = "nameStartsWith"
}

struct ApiKeys {
    
    static func getCharactersParams(offset: Int = 0) -> [String: Any] {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(StaticStrings.kApiPrivatKey)\(StaticStrings.kApiPublicKey)"
        
        return [
            ParamKeys.apikey : StaticStrings.kApiPublicKey,
            ParamKeys.timeStamp : timeStamp,
            ParamKeys.hash : hash.md5(),
            ParamKeys.offset : offset
        ]
    }
    
    static func getComicsParams() -> [String: Any] {
        let timeStamp = Int(Date().timeIntervalSince1970)
        let hash = "\(timeStamp)\(StaticStrings.kApiPrivatKey)\(StaticStrings.kApiPublicKey)"
        
        return [
            ParamKeys.apikey : StaticStrings.kApiPublicKey,
            ParamKeys.timeStamp : timeStamp,
            ParamKeys.hash : hash.md5()
        ]
    }
}

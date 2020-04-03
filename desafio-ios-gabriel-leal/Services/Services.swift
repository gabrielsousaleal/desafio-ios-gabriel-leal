//
//  Services.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

final class Services: ServicesProtocol {
    
    func getCharacters(offset: Int = 0, success: @escaping ([Character]) -> Void, failure: @escaping (Error) -> Void) {
        let params = ApiKeys.getCharactersParams(offset: offset)
        ApiManager().getFrom(StaticStrings.kCharactersMethod, params: params, success: { data in
            let characters = self.unwrapCharacters(data: data)
            success(characters)
        }, failure: { error in
            failure(error)
        })
    }
    
    func unwrapCharacters(data: Data) -> [Character] {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(CharactersResult.self, from: data)
            let characters = result.data.characters
            return characters
        } catch {
            print(error)
        }
        return []
    }
}

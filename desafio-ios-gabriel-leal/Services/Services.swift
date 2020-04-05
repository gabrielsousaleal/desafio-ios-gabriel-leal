//
//  Services.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

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
    
    func getImage(path: String, completion: @escaping(UIImage) -> ()){
        Alamofire.request(path).responseImage { (response) in
            if let result = response.result.value {
                completion(result)
            } else {
                completion(UIImage(named: "posterNaoEncontrado") ?? UIImage())
            }
        }
    }
    
    func getCharacterComics(method: String, success: @escaping ([CharacterComicsResult]) -> Void, failure: @escaping (Error) -> Void) {
        let params = ApiKeys.getComicsParams()
        ApiManager().getFrom(method, params: params, success: { data in
            let comics = self.unwrapComics(data: data)
            success(comics)
        }, failure: { error in
            failure(error)
        })
    }
}

extension Services {
    private func unwrapCharacters(data: Data) -> [Character] {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(CharactersResult.self, from: data)
            let characters = result.data!.characters!
            return characters
        } catch {
            print(error)
        }
        return []
    }
    
    private func unwrapComics(data: Data) -> [CharacterComicsResult] {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(CharacterComics.self, from: data)
            let comics = result.data?.results ?? []
            return comics
        } catch {
            print(error)
        }
        return []
    }
}

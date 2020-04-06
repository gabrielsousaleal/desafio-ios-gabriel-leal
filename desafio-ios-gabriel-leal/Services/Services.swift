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
            self.unwrapCharacters(data: data, success: { characters in
                success(characters)
            }, failure: { error in
                failure(error)
            })
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
            self.unwrapComics(data: data, success: { comics in
                success(comics)
            }, failure: { error in
                failure(error)
            })
        }, failure: { error in
            failure(error)
        })
    }
}

extension Services {
    private func unwrapCharacters(data: Data, success: @escaping([Character]) -> Void, failure: @escaping(Error) -> Void) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(CharactersResult.self, from: data)
            guard let characters = result.data?.characters else {
                let errorCode = -1
                let error = NSError(domain: String.empty, code: errorCode, userInfo: nil)
                failure(error)
                return
            }
            success(characters)
        } catch {
            failure(error)
        }
    }
    
    private func unwrapComics(data: Data, success: @escaping([CharacterComicsResult]) -> Void, failure: @escaping(Error) -> ()) {
        do {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let result = try decoder.decode(CharacterComics.self, from: data)
            guard let comics = result.data?.results else {
                let errorCode = -1
                let error = NSError(domain: String.empty, code: errorCode, userInfo: nil)
                failure(error)
                return
            }
            success(comics)
        } catch {
            failure(error)
        }
    }
}

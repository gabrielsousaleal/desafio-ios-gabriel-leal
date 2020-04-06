//
//  ServicesMock.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 06/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class ServicesMock: ServicesProtocol {
    func getCharacters(offset: Int, success: @escaping ([Character]) -> Void, failure: @escaping (Error) -> Void) {
        getJSONData(fileName: "", success: { data in
            let characters = self.unwrapCharacters(data: data)
            success(characters)
        }, failure: { error in
            failure(error)
        })
    }
    
    func getImage(path: String, completion: @escaping (UIImage) -> ()) {
        let image = UIImage(named: StaticStrings.kLoadingImage) ?? UIImage()
        completion(image)
    }
    
    func getCharacterComics(method: String, success: @escaping ([CharacterComicsResult]) -> Void, failure: @escaping (Error) -> Void) {
        getJSONData(fileName: "comics", success: { data in
            let characters = self.unwrapComics(data: data)
            success(characters)
        }, failure: { error in
            failure(error)
        })
    }
}

extension ServicesMock {
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
    
    private func getJSONData(fileName: String, success: @escaping(Data) -> Void, failure: @escaping(Error) -> ()) {
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                success(data)
              } catch {
                   failure(error)
              }
        }
    }
}

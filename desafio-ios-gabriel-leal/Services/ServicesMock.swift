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
        getJSONData(fileName: "characters", success: { data in
            self.unwrapCharacters(data: data, success: { characters in
                success(characters)
            }, failure: { error in
                failure(error)
            })
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

extension ServicesMock {
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

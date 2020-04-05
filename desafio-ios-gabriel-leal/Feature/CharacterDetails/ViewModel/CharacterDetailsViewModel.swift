//
//  CharacterDetailsViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 04/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit
 
class CharacterDetailsViewModel {
    
    //****************************************************************
    // MARK: - Private Properties
    //****************************************************************
    
    private let model: Character
    private let service: ServicesProtocol
    
    //****************************************************************
    // MARK: - Life Cicle
    //****************************************************************
    
    init(model: Character, service: ServicesProtocol) {
        self.model = model
        self.service = service
    }
    
    //****************************************************************
    // MARK: - Public Properties
    //****************************************************************
    
    var name: String {
        return model.name ?? String.empty
    }
    
    var description: String {
        if model.resultDescription == String.empty {
            return StaticStrings.kNoCharacterDescriptionFound
        }
        return model.resultDescription ?? StaticStrings.kNoCharacterDescriptionFound
    }
    
    var characterId: String {
        guard let idInt = model.id else { return String.empty }
        let idString = String(idInt)
        return idString
    }
    
    //****************************************************************
    // MARK: - Public Methods
    //****************************************************************
    
    func fetchImage(completion: @escaping(UIImage) -> Void) {
        let path = makeImagePath()
        service.getImage(path: path, completion: { result in
           completion(result)
        })
    }
    
    //****************************************************************
    // MARK: - Private Methods
    //****************************************************************
    
    private func makeImagePath() -> String {
        guard let thumb: String = model.thumbnail?.path, let thumbExtension = model.thumbnail?.thumbnailExtension else { return String.empty }
        
        let path = thumb + "/" + StaticStrings.kStandardFantasticImageExtension + "." + thumbExtension
        return path
    }
}

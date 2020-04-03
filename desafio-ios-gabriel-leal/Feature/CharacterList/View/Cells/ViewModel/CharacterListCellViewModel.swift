//
//  CharacterListCellViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterListCellViewModel {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    private var model: Character
    private var service: ServicesProtocol
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    init(model: Character, service: ServicesProtocol) {
        self.model = model
        self.service = service
    }
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    var characterName: String {
        return model.name
    }
    
    func fetchImage(completion: @escaping(UIImage) -> Void) {
        let path = makeImagePath()
        service.getImage(path: path, completion: { result in
           completion(result)
        })
    }
    
    private func makeImagePath() -> String {
        let path = model.thumbnail.path + "/" + StaticStrings.kLargeImageExtension + "." + model.thumbnail.thumbnailExtension.rawValue
        return path
    }
}

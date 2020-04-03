//
//  CharacterListCellViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

class CharacterListCellViewModel {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    private var model: Character
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    init(model: Character) {
        self.model = model
    }
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    var characterName: String {
        return model.name
    }
    
}

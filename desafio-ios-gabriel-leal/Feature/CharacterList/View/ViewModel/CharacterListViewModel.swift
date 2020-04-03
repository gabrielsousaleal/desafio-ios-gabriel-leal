//
//  CharacterListViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    private let service: ServicesProtocol
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    var reload: (() -> Void)?
    
    var showError: (() -> Void)?
    
    var charactersCount: Int {
        return model.count
    }
    
    var model: [Character] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reload?()
            }
        }
    }
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    init(service: ServicesProtocol) {
        self.service = service
        fetchCharacterList()
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    private func fetchCharacterList() {
        service.getCharacters(offset: 0, success: { characters in
            self.model += characters
        }, failure: { error in
            self.showError?()
        })
    }
}

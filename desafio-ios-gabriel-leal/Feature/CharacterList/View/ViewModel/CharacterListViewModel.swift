//
//  CharacterListViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 03/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

class CharacterListViewModel {
    
    var reload: (() -> Void)?
    
    private let service: ServicesProtocol
    
    var model: [Character] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reload?()
            }
        }
    }
    
    
    init(service: ServicesProtocol) {
        self.service = service
        fetchCharacterList()
    }
    
    func fetchCharacterList() {
        service.getCharacters(offset: 0, success: { characters in
            self.model += characters
        }, failure: { error in
            print(error)
        })
    }
    
    var charactersCount: Int {
        return model.count
    }
}

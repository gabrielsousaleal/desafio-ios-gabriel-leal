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
    private var page = 0
    
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
        fetchCharacterList(offset: 0)
    }
    
    //****************************************************************
    //MARK: Public Methods
    //****************************************************************
    
    func fetchNextPage() {
        page += 1
        let offset = page * 20
        fetchCharacterList(offset: offset)
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    private func fetchCharacterList(offset: Int) {
        service.getCharacters(offset: offset, success: { characters in
            self.model += characters
        }, failure: { error in
            self.showError?()
        })
    }
}

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
    
    var showError: ((_ error: Error) -> Void)?
    
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
        fetchCharacterList(offset: 0, failure: { error in
            self.showError?(error)
        })
    }
    
    //****************************************************************
    //MARK: Public Methods
    //****************************************************************
    
    func fetchNextPage() {
        page += 1
        let offset = page * 20
        fetchCharacterList(offset: offset, failure: { error in
            self.showError?(error)
        })
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    func fetchCharacterList(offset: Int, failure: @escaping(Error) -> Void) {
        service.getCharacters(offset: offset, success: { characters in
            self.model += characters
        }, failure: { error in
            failure(error)
            self.showError?(error)
        })
    }
}

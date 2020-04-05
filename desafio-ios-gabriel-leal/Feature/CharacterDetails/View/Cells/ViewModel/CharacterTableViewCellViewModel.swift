//
//  tableViewViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

class CharacterTableViewCellViewModel {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    private var id: String
    private var service: ServicesProtocol
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    init(id: String, service: ServicesProtocol) {
        self.id = id
        self.service = service
    }
    
    //****************************************************************
      //MARK: Private Methods
      //****************************************************************
      
      private func createMethod() -> String {
          let method = StaticStrings.kCharactersMethod + "/" + id + "/" + StaticStrings.kComicsMethod
          return method
      }
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    func getComics(success: @escaping([CharacterComicsResult]) -> Void, failure: @escaping(Error) -> Void) {
        let method = createMethod()
        service.getCharacterComics(method: method, success: { comics in
            success(comics)
        }, failure: { error in
            failure(error)
        })
    }
}

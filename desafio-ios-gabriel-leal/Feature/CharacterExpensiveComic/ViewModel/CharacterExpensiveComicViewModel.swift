//
//  CharacterExpensiveCellViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterExpensiveComicViewModel {
    
    //****************************************************************
    //MARK: Private Properties
    //****************************************************************
    
    private let model: [CharacterComicsResult]
    
    //****************************************************************
    //MARK: Life Cicle
    //****************************************************************
    
    init(model: [CharacterComicsResult]) {
        self.model = model
    }
    
    //****************************************************************
    //MARK: Public Properties
    //****************************************************************
    
    var expensiveComic: CharacterComicsResult {
        return getExpensiveComic()
    }
    
    //****************************************************************
    //MARK: Private Methods
    //****************************************************************
    
    private func getExpensiveComic() -> CharacterComicsResult {
        var expensive: CharacterComicsResult!
        var value: Double = 0
        for comic in model {
            if comic.prices?.first?.price ?? 0 > value {
                value = comic.prices?.first?.price ?? 0
                expensive = comic
            }
        }
        return expensive
    }
}

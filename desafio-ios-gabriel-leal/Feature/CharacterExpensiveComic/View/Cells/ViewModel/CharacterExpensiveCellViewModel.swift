//
//  CharacterExpensiveComicViewModel.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class CharacterExpensiveCellViewModel {
    
    //****************************************************************
    // MARK: - Private Properties
    //****************************************************************
    
    private let model: CharacterComicsResult
    private let service: ServicesProtocol
    
    //****************************************************************
    // MARK: - Life Cicle
    //****************************************************************
    
    init(model: CharacterComicsResult, service: ServicesProtocol) {
        self.model = model
        self.service = service
    }
    
    //****************************************************************
    // MARK: - Public Properties
    //****************************************************************
    
    var title: String {
        return model.title ?? String.empty
    }
    
    var description: String {
        return model.description ?? String.empty
    }
    
    var price: String {
        let string = String.doubleToDollar(double: model.prices?.first?.price ?? 0)
        return string
    }
    
    //****************************************************************
    // MARK: - Private Methods
    //****************************************************************
        
    private func makeImagePath() -> String {
        guard let thumb: String = model.thumbnail?.path, let thumbExtension = model.thumbnail?.thumbnailExtension else { return String.empty }
        
        let path = thumb + "/" + StaticStrings.kIncredibleImageExtension + "." + thumbExtension
        return path
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
}

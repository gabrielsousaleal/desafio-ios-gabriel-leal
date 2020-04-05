//
//  StaticStrings.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

struct StaticStrings {
    static let kApiEndpoint = "http://gateway.marvel.com/v1/public/"
    static let kApiPrivatKey = "b8748df86e248c08a7bbe6afd2578e9b6c59eb1f"
    static let kApiPublicKey = "66ca5db7c8bd304d93eb6568faa9a88c"
    static let kCharactersMethod = "characters"
    static let kComicsMethod = "comics"
    static let kSmallImageExtension = "portrait_small"
    static let kMediumImageExtension = "portrait_medium"
    static let kLargeImageExtension = "portrait_xlarge"
    static let kFantasticImageExtension = "portrait_fantastic"
    static let kUncannyImageExtension = "portrait_uncanny"
    static let kIncredibleImageExtension = "portrait_incredible"
    static let kStandardFantasticImageExtension = "standard_fantastic"
    static let kStandardAmazingImageExtension = "standard_amazing"
    static let kLoadingAnimationName = "loading"
    static let kLoadingImage = "loadingImage"
    
    static let kNoCharacterDescriptionFound = "Esse personagem não tem descrição"
    static let kBackButtonTitle = "Voltar"
    static let k404 = "Parece que o serviço está offline, ou você está sem internet!"
    static let k409 = "A API key, Hash ou timestamp estão incorretas!"
    static let k401 = "Hash ou API Key inválidas!"
    static let k405 = "Método não permitido!"
    static let k403 = "Você não tem acesso!"
    static let kGenericError = "Aconteceu algum erro!"
}

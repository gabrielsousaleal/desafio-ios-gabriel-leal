//
//  Router.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 04/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class Router {
    static func pushCharacterDetailsViewController(viewModel: CharacterDetailsViewModel, navigationController: UINavigationController?) {
        let vc = CharacterDetailsViewController(nibName: "CharacterDetailsXib", bundle: Bundle.main)
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    static func pushCharacterExpensiveComicViewController(viewModel: CharacterExpensiveComicViewModel, navigationController: UINavigationController?) {
        let vc = CharacterExpensiveComicViewController(nibName: "CharacterExpensiveComicXib", bundle: Bundle.main)
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: false)
    }
}

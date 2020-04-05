//
//  Router.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 04/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit
import Lottie

class Router {
    static func pushCharacterDetailsViewController(viewModel: CharacterDetailsViewModel, navigationController: UINavigationController?) {
        let vc = CharacterDetailsViewController(nibName: "CharacterDetailsXib", bundle: Bundle.main)
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    static func pushCharacterExpensiveComicViewController(viewModel: CharacterExpensiveComicViewModel, navigationController: UINavigationController?) {
        let vc = CharacterExpensiveComicViewController(nibName: "CharacterExpensiveComicXib", bundle: Bundle.main)
        vc.viewModel = viewModel
        navigationController?.pushViewController(vc, animated: true)
    }
    
    static func showAlert(title: String, message: String, navigationController: UINavigationController?) {
         let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
         
         navigationController?.topViewController?.present(alert, animated: true)
         let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
             alert.dismiss(animated: true)
         }
         alert.addAction(okAction)
     }
    
    static func showLoading(navigationController: UINavigationController?) -> AnimationView {
        let animationView = AnimationView(name: StaticStrings.kLoadingAnimationName)
        animationView.frame = UIScreen.main.bounds
        navigationController?.topViewController?.view.addSubview(animationView)
        animationView.loopMode = .loop
        animationView.play()
        
        return animationView
    }
}

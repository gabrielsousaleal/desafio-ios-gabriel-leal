//
//  UINavigationControllerExtension.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

extension UINavigationController {
    func setNavBarTransparent() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
    
    func hideNavBar() {
        isNavigationBarHidden = true
    }
    
    func showNavBar() {
        isNavigationBarHidden = false
    }
}

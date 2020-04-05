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
        navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
        navigationBar.tintColor = UIColor.red
    }
    
    func hideNavBar() {
        isNavigationBarHidden = true
    }
    
    func showNavBar() {
        isNavigationBarHidden = false
    }
}

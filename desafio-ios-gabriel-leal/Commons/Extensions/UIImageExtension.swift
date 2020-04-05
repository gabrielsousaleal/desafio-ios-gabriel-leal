//
//  UIImageExtension.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

extension UIImage {
    static func loadingCharacterImage() -> UIImage {
        return UIImage(named: StaticStrings.kLoadingImage) ?? UIImage()
    }
}


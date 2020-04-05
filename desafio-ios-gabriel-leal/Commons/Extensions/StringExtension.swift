//
//  UIString.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

extension String {
    static let empty = String()
    
    static func doubleToDollar(double: Double) -> String {
        return "U$ \(double)"
    }
}

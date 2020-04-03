//
//  ServicesProtocol.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

protocol ServicesProtocol: class {
    func getCharacters(offset: Int, success: @escaping ([Character]) -> Void, failure: @escaping (Error) -> Void)
}

//
//  ViewController.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let service = Services()
        
        let offset = 20
        
        service.get(offset: offset, success: { characters in
            print(characters.first?.name)
        }) { error in
            print(error)
        }
        
    }


}


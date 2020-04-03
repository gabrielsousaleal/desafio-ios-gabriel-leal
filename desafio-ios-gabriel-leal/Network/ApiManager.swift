//
//  Services.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation
import Alamofire

class ApiManager {
    
    //****************************************************************
    // MARK: Private Properties
    //****************************************************************
    
    private let ApiEndpoint: String = StaticStrings.kApiEndpoint
    
    //****************************************************************
    // MARK: Public Methods
    //****************************************************************
    
    func getFrom(_ method: String, params: [String: Any]? = nil, completion: @escaping(Any?) -> Void) {
        Alamofire.request(ApiEndpoint + method, method: .get, parameters: params)
            .validate()
            .responseData { (response) in
                switch response.result {
                case .success:
                    completion(response.data!)
                    break
                case .failure(let error):
                    completion(error)
                    break
                }
        }
    }
}

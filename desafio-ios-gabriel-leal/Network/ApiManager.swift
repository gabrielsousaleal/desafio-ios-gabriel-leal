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
    
    func getFrom(_ method: String, params: [String: Any]? = nil, success: @escaping(Data) -> Void, failure: @escaping(Error) -> Void) {
        
        Alamofire.request(ApiEndpoint + method, method: .get, parameters: params)
            .validate()
            .response(completionHandler: { response in
                if let data = response.data, response.error == nil {
                    success(data)
                }
                
                if let _ = response.error {
                    let errorCode = response.response?.statusCode ?? 404
                    let apiError = NSError(domain: "", code: errorCode, userInfo: nil)
                    failure(apiError)
                }
            })
    }
}

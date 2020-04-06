//
//  ErrorExtension.swift
//  desafio-ios-gabriel-leal
//
//  Created by Gabriel Sousa on 05/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import Foundation

extension Error {
    func getDescription() -> String {
        let nsError = self as NSError
        let errorCode = nsError.code
        
        switch errorCode {
        case 1000:
            return StaticStrings.k1000
        case 1009:
            return StaticStrings.k1009
        case 404:
            return StaticStrings.k404
        case 409:
            return StaticStrings.k409
        case 401:
            return StaticStrings.k401
        case 405:
            return StaticStrings.k405
        case 403:
            return StaticStrings.k403
        default:
            return StaticStrings.kGenericError
        }
    }
}
//409    Missing API Key    Occurs when the apikey parameter is not included with a request.
//409    Missing Hash    Occurs when an apikey parameter is included with a request, a ts parameter is present, but no hash parameter is sent. Occurs on server-side applications only.
//409    Missing Timestamp    Occurs when an apikey parameter is included with a request, a hash parameter is present, but no ts parameter is sent. Occurs on server-side applications only.
//401    Invalid Referer    Occurs when a referrer which is not valid for the passed apikey parameter is sent.
//401    Invalid Hash    Occurs when a ts, hash and apikey parameter are sent but the hash is not valid per the above hash generation rule.
//405    Method Not Allowed    Occurs when an API endpoint is accessed using an HTTP verb which is not allowed for that endpoint.
//    403    Forbidden    Occurs when a user with an otherwise authenticated request attempts to access an endpoint to which they do not have access.

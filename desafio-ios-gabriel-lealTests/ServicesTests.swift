//
//  desafio_ios_gabriel_lealTests.swift
//  desafio-ios-gabriel-lealTests
//
//  Created by Gabriel Sousa on 02/04/20.
//  Copyright © 2020 Gabriel Sousa. All rights reserved.
//

import XCTest
@testable import desafio_ios_gabriel_leal

class ServicesTests: XCTestCase {
    
    var service: ServicesProtocol!
    
    override func setUp() {
        service = ServicesMock()
    }
    
    func testGetCharacterComicsShouldSuccess() {
        service.getCharacterComics(method: String.empty, success: { comics in
            XCTAssertNotNil(comics)
        }, failure: { error in
            XCTFail()
        })
    }
    
    func testGetCharacteShouldSuccess() {
        service.getCharacters(offset: 0, success: { characters in
            XCTAssertNotNil(characters)
        }, failure: { error in
            XCTAssertNil(error, error.getDescription())
        })
    }
}

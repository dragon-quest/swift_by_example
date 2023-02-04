//
//  TestAPIKit.swift
//  FunRecipeTests
//
//  Created by 中江洋史 on 2022/10/31.
//

import XCTest
@testable import FunRecipe

class TestAPIKit: XCTestCase {
    func testURLQueryBuilder() throws {
        let items: [QueryItem] = [
            QueryItem(name: ParameterName.OFFSET.rawValue, value: "5"),
            QueryItem(name: ParameterName.LIMIT.rawValue, value: "15")
        ]
        let exp = expectation(description: "parameter cheack")
        APIKit.shared.fetch(url: Constants.COOKING_RECORDS_API, method: .GET, queryItems: items) { (data, response, error) in
            XCTAssertEqual(response, 200)
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetch() throws {
        let exp = expectation(description: "fetch get")
        APIKit.shared.fetch(url: Constants.COOKING_RECORDS_API) { (data, response, error) in
            XCTAssertEqual(response, 200)
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetch404() throws {
        let exp = expectation(description: "network error 404")
        APIKit.shared.fetch(url: Constants.COOKING_RECORDS_API, method: .POST) { (data, response, error) in
            XCTAssertEqual(response, 404)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}

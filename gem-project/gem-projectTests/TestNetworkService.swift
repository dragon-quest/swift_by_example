//
//  TestNetworkService.swift
//  FunRecipeTests
//
//  Created by 中江洋史 on 2022/10/31.
//

import XCTest
@testable import FunRecipe

class TestNetworkService: XCTestCase {
    func testCookingRecord() throws {
        let exp = expectation(description: "test cooking record")
        let offset = 0
        let limit = 6
        NetworkService.shared.cookingRecord(offset, limit) { data, error in
            XCTAssertNil(error)
            XCTAssertNotNil(data)
            XCTAssertEqual(data?.pagination.limit, limit)
            XCTAssertEqual(data?.pagination.offset, offset)
            XCTAssertEqual(data?.cooking_records.count, limit)
            exp.fulfill()
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testGetImageData() throws {
        let exp = expectation(description: "test get image data")
        let offset = 0
        let limit = 1
        NetworkService.shared.cookingRecord(offset, limit) { data, error in
            XCTAssertNotNil(data?.cooking_records.first?.image_url)
            guard let image_url = data?.cooking_records.first?.image_url else {
                exp.fulfill()
                return
            }
            NetworkService.shared.getImageData(url: image_url) { data, error in
                XCTAssertNil(error)
                XCTAssertNotNil(data)
                exp.fulfill()
            }
        }
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}

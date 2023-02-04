//
//  FunRecipeTests.swift
//  FunRecipeTests
//
//  Created by 中江洋史 on 2022/11/01.
//

import XCTest
@testable import FunRecipe

class FunRecipeTests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.timeZone = NSTimeZone.system

        let date = formatter.date(from: "2020-04-10 21:00:00")
        if let date = date?.string(format: "yyyy-M-d") {
            XCTAssertEqual(date, "2020-04-10")
        }
        if let date = date?.string() {
            XCTAssertEqual(date, "2020-04-10 21:00:00")
        }

        let img = UIImage(url: "https://cooking-records.herokuapp.com/images/1.jpg")
        XCTAssertNotNil(img)

        XCTAssertEqual("2020-04-10 21:00:00".stringFromDate(format: "yyyy-M-d"), "2020-4-10")
        XCTAssertEqual("2020-04-10 21:10:11".stringFromDate(), "2020-4-10 21:10:11")
        XCTAssertEqual("AAA".stringFromDate(), "")
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

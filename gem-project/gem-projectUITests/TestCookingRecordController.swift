//
//  TestCookingRecordController.swift
//  FunRecipeUITests
//
//  Created by 中江洋史 on 2022/11/02.
//

import XCTest

class TestCookingRecordController: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // UI tests must launch the application that they test.
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTContext.runActivity(named: "TableViewのidentifierを確認") { (activity) in
            waitToAppear(for: app.tables["CookingRecordTableView"])
            XCTAssertEqual(app.tables["CookingRecordTableView"].identifier, "CookingRecordTableView")
        }
        
        XCTContext.runActivity(named: "CookingRecordTableViewのidentifierを確認") { (activity) in
            let rowCount = 10
            XCTAssertEqual(app.cells.count, 10)
            
            for i in 0 ..< rowCount {
                waitToAppear(for: app.cells["CookingRecordTableViewCell_\(i)"])
                XCTAssertEqual(app.cells["CookingRecordTableViewCell_\(i)"].identifier, "CookingRecordTableViewCell_\(i)")
                
                waitToAppear(for: app.staticTexts["CommentLabel_\(i)"])
                XCTAssertEqual(app.staticTexts["CommentLabel_\(i)"].identifier, "CommentLabel_\(i)")
                
                waitToAppear(for: app.staticTexts["RecordedAtLabel_\(i)"])
                XCTAssertEqual(app.staticTexts["RecordedAtLabel_\(i)"].identifier, "RecordedAtLabel_\(i)")
                
                waitToAppear(for: app.staticTexts["RecipeTypeLabel_\(i)"])
                XCTAssertEqual(app.staticTexts["RecipeTypeLabel_\(i)"].identifier, "RecipeTypeLabel_\(i)")
            }
        }
    }
    
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCTestCase {
    func waitToAppear(for element: XCUIElement,
                      timeout: TimeInterval = 5,
                      file: StaticString = #file,
                      line: UInt = #line) {
        let predicate = NSPredicate(format: "exists == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, .completed, file: file, line: line)
    }
    
    func waitToHittable(for element: XCUIElement,
                        timeout: TimeInterval = 5,
                        file: StaticString = #file,
                        line: UInt = #line) -> XCUIElement {
        let predicate = NSPredicate(format: "hittable == true")
        let expectation = XCTNSPredicateExpectation(predicate: predicate, object: element)
        let result = XCTWaiter().wait(for: [expectation], timeout: timeout)
        XCTAssertEqual(result, .completed, file: file, line: line)
        return element
    }
}

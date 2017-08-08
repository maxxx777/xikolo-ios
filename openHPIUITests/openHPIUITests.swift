//
//  openHPIUITests.swift
//  openHPIUITests
//
//  Created by Jan Renz on 08.08.17.
//  Copyright © 2017 HPI. All rights reserved.
//

import XCTest

class openHPIUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLogin() {
         // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        TestHelper.login()
        let app = XCUIApplication()
        app.staticTexts["itunes Connect"].waitForExistence(timeout:10)

    }
    
    func testCourseList() {
        let app = XCUIApplication()
        TestHelper.login()
        app.tabBars.buttons["Courses"].tap()
        app.tabBars.buttons["Dashboard"].tap()
        app.tabBars.buttons["Courses"].tap()
        app.navigationBars["openHPI.CourseListView"].buttons["My Courses"].tap()
        app.navigationBars["openHPI.CourseListView"].buttons["Find Courses"].tap()
    }
    

    func testCourseDetails() {
        let app = XCUIApplication()
        TestHelper.login()
        app.tabBars.buttons["Courses"].tap()
        //app.navigationBars["openHPI.CourseListView"].buttons["Find Courses"].tap()
        app.navigationBars["openHPI.CourseListView"].buttons["My Courses"].tap()
        app.staticTexts["Embedded Smart Home"].tap()
    
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 0).staticTexts["Materialien"].tap()
        app.navigationBars["openHPI.RichtextView"].children(matching: .button).matching(identifier: "Back").element(boundBy: 0).tap()
        tablesQuery.staticTexts["W0-0 Kursübersicht"].tap()
        app.scrollViews.otherElements.buttons["open slides"].tap()

        let backButton = app.navigationBars.children(matching: .button).matching(identifier: "Back").element(boundBy: 0)
        backButton.tap()
        backButton.tap()
        backButton.tap()
        
    }
    
}

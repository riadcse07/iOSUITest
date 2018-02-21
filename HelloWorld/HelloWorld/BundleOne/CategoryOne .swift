//
//  CategoryOne.swift
//  BundleOne
//
//  Created by Mahmud Riad on 2/16/18.
//  Copyright © 2018 Mahmud Hasan Riad. All rights reserved.
//

import XCTest

class CategoryOne: XCTestCase{
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        let observer = TestObserver() // your created observer class
        let observationCenter = XCTestObservationCenter.shared
        observationCenter.addTestObserver(observer)
        
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLogInAnyway() {
        let app = XCUIApplication()
        clickOnLogInAnywayButton()
        XCTAssertTrue(app.buttons["Back"].exists, "Get Started without login failed.---1234")
    }
    
    func testBackToLogInPage() {
        let app = XCUIApplication()
        clickOnLogInAnywayButton()
        clickOnBackButton()
        XCTAssertTrue(app.buttons["Log In"].exists, "Back to log in page failed.---12345")
    }
    
    func testBackToLogInPageNegativeCase() {
        let app = XCUIApplication()
        clickOnLogInAnywayButton()
        clickOnBackButton()
        XCTAssertTrue(app.buttons["Back"].exists, "Dashboard page exists falsely.---1234560910")
        
    }
    
}

//
//  UITestutils.swift
//  UITests
//
//  Created by Mahmud Riad on 2/15/18.
//  Copyright © 2018 Mahmud Hasan Riad. All rights reserved.
//

import XCTest

// Tap
extension XCTestCase {
    
    func clickOnLogInAnywayButton() {
        let app = XCUIApplication()
        if (app.buttons["Log In Anyway"].exists){
            app.buttons["Log In Anyway"].tap()
        }
    }
    
    func clickOnBackButton() {
        let app = XCUIApplication()
        if (app.buttons["Back"].exists){
            app.buttons["Back"].tap()
        }
    }
    
}

extension XCUIElement {
    func forceTap() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.5, dy:0.5))
            coordinate.doubleTap()
            //coordinate.press(forDuration: 0.5)
        }
    }
    
    func forceSingleTap() {
        if self.isHittable {
            self.tap()
        }
        else {
            let coordinate: XCUICoordinate = self.coordinate(withNormalizedOffset: CGVector(dx:0.5, dy:0.5))
            coordinate.tap()
            //coordinate.press(forDuration: 0.5)
        }
    }
    
}

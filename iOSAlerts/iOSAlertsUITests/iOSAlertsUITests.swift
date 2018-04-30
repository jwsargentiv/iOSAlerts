//
//  iOSAlertsUITests.swift
//  iOSAlertsUITests
//
//  Created by James Sargent on 4/27/18.
//  Copyright © 2018 URBN. All rights reserved.
//

import XCTest

class iOSAlertsUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
            continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocation() {
        XCUIApplication().buttons["Location"].tap()
        alertHandlers(enabled: false)
    }
    
    func testNotifications() {
        XCUIApplication().buttons["Notifications"].tap()
        alertHandlers(enabled: true)
    }
    
    func alertHandlers(enabled: Bool) {
        addUIInterruptionMonitor(withDescription: "Notification Dialog") { (alert) -> Bool in
            var alertButton = alert.buttons["Don't Allow"]
            if enabled == true {
                alertButton = alert.buttons["Allow"]
            }
            if alertButton.exists {
                alertButton.tap()
                return true
            }
            XCUIApplication().tap()
            return false
        }
        addUIInterruptionMonitor(withDescription: "Location Dialog") { (alert) -> Bool in
            var alertButton = alert.buttons["Don't Allow"]
            if enabled == true {
                alertButton = alert.buttons["Always Allow"]
            }
            if alertButton.exists {
                alertButton.tap()
                return true
            }
            XCUIApplication().tap()
            return false
        }
        addUIInterruptionMonitor(withDescription: "Photos Dialog") { (alert) -> Bool in
            var alertButton = alert.buttons["Don't Allow"]
            if enabled == true {
                alertButton = alert.buttons["OK"]
            }
            if alertButton.exists {
                alertButton.tap()
                return true
            }
            XCUIApplication().tap()
            return false
        }
        XCUIApplication().swipeUp()
    }
    
    func allowLocation() {
        addUIInterruptionMonitor(withDescription: "Location Services") { (alert) -> Bool in
            let alertButton = alert.buttons["Always Allow"]
            
            if alertButton.exists {
                alertButton.tap()
                return true
            }
            XCUIApplication().tap()
            return false
        }
        XCUIApplication().swipeUp()
    }
    
    func allowNotifications() {
        addUIInterruptionMonitor(withDescription: "Notifications Alert") { (alert) -> Bool in
            let alertButton = alert.buttons["Allow"]
            
            if alertButton.exists {
                alertButton.tap()
                return true
            }
            XCUIApplication().tap()
            return false
        }
        XCUIApplication().swipeUp()
    }
    
}

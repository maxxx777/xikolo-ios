//
//  TestHelper.swift
//  openHPIUITests
//
//  Created by Jan Renz on 08.08.17.
//  Copyright © 2017 HPI. All rights reserved.
//

import Foundation
import XCTest

class TestHelper {
    static func login(){
        let app = XCUIApplication()
        let (username, password) = self.getLogin()
        app.tabBars.buttons["Settings"].tap()
        let logoutButton = app.tables.staticTexts["Logout"].firstMatch
        if logoutButton.exists {
            logoutButton.tap();
        }
        app.navigationBars["Settings"].buttons["Login"].tap()
        
        let elementsQuery = app.scrollViews.otherElements
        let emailTextField = elementsQuery.textFields["Email"]
        emailTextField.tap()
        emailTextField.typeText(username)
        
        let passwordSecureTextField = elementsQuery.secureTextFields["Password"]
        passwordSecureTextField.tap()
        passwordSecureTextField.typeText(password)
        elementsQuery.buttons["Login"].tap()
       
    }
    
    static func getLogin()->(String, String){
//        var myDict: NSDictionary?
//        if let path = Bundle.path(forResource: "accounts.plist", ofType: "plist", inDirectory: "openHPIUITests") {
//            myDict = NSDictionary(contentsOfFile: path)
//        }
//        if let dict = myDict {
//            // Use your dict here
//        }
        return ("itunes_connect@openhpi.de","xxxxx")
    }
}

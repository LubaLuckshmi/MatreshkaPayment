//
//  MatreshkaPayAppUITests.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import XCTest

final class MatreshkaPayUITests: XCTestCase {

    var app: XCUIApplication!
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
    }

    override func tearDownWithError() throws {
        app = nil
        try super.tearDownWithError()
    }

    func testEnteringAmount() {
        // Test entering 'from' amount
        let fromCurrencyTextField = app.textFields["FromCurrencyTextField"]
        XCTAssertTrue(fromCurrencyTextField.exists)
        fromCurrencyTextField.tap()
                fromCurrencyTextField.typeText("100")
        
        sleep(3)
        XCTAssertEqual(fromCurrencyTextField.value as! String, "100")
        
            // Test entering 'to' amount
        let toCurrencyTextField = app.textFields["ToCurrencyTextField"]
        XCTAssertTrue(toCurrencyTextField.exists)
        toCurrencyTextField.tap()
        toCurrencyTextField.doubleTap()
        toCurrencyTextField.typeText("100")
        
        sleep(3)
        XCTAssertEqual(toCurrencyTextField.value as! String, "100")
        
        // Test choose 'from' currency
        let fromCurrencyView = app.otherElements["FromCurrencyView"]
        XCTAssertTrue(fromCurrencyView.exists)
        fromCurrencyView.tap()
        
        // Test choose 'to' currency
        _ = app.otherElements["ToCurrencyView"]
        
    }
}

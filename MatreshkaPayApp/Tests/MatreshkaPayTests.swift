//
//  MatreshkaPayAppTests.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import XCTest
@testable import MatreshkaPayApp

class MockCurrencyConverterNetworkManager: CurrencyConverterNetworkManager {
    func convertCurrency(from: String, to: String, amount: Double) async throws -> Double {
        1.1 // Return dummy conversion rate
    }

    func availableCurrencies() async throws -> [Currency] {
        [] // Return empty array or dummy currency array
    }
}

class MatreshkaPayNetworkManagerTests: XCTestCase {
    var manager: CurrencyConverterNetworkManager!

    override func setUp() {
        super.setUp()
        manager = MockCurrencyConverterNetworkManager()
    }

    override func tearDown() {
        manager = nil
        super.tearDown()
    }

    func testConvertCurrency() async throws {
        let conversionRate = try await manager.convertCurrency(from: "USD", to: "EUR", amount: 1.0)
        XCTAssertEqual(conversionRate, 1.1)
    }

    func testAvailableCurrencies() async throws {
        let currencies = try await manager.availableCurrencies()
        XCTAssertTrue(currencies.isEmpty) // Verify currencies matches mock response
    }
}

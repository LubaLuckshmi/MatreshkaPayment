//
//  CurrencyConverterNetworkManager.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

protocol CurrencyConverterNetworkManager {
    
    func convertCurrency(
        from: String,
        to: String,
        amount: Double
    ) async throws -> Double
    func availableCurrencies() async throws -> [Currency]
}

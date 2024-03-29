//
//  Currency.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

struct Currency: Codable, Equatable {
    let currencyCode: String
    let currencyName: String
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        lhs.currencyCode == rhs.currencyCode
    }
}

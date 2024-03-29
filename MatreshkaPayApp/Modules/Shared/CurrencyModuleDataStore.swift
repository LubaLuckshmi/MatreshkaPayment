//
//  CurrencyModuleDataStore.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

class CurrencyModuleDataStore: DataStore {
    
    typealias E = Currency
    
    // MARK: - Properties
    
    var selectedElement: Currency?
    var elements: [Currency] = []
    var filteredElements: [Currency] = []
    var onDataUpdated: (() -> Void)?
    
    // MARK: - Methods
    
    func updateData() {
        onDataUpdated?()
    }
}

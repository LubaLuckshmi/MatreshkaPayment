// 
//  HomeRouter.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

protocol HomeRoutable {
    func navigateCurrenciesList(dataStore: CurrencyModuleDataStore)
}

final class HomeRouter: HomeRoutable {
    
    // MARK: - Properties
    
    private weak var view: HomeVC?
    
    // MARK: - Init
    
    init(view: HomeVC) {
        self.view = view
    }
    
    // MARK: - HomeRoutable methods
    
    func navigateCurrenciesList(dataStore: CurrencyModuleDataStore) {
        let currenciesListVC = CurrenciesListBuilder.build(dataStore: dataStore)
        view?.present(currenciesListVC, animated: true)
    }
    
}

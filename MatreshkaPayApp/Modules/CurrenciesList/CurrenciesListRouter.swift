// 
//  CurrenciesListRouter.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

protocol CurrenciesListRoutable {
    func dismissList()
}

final class CurrenciesListRouter: CurrenciesListRoutable {
    
    // MARK: - Properties
    
    private weak var view: CurrenciesListVC?
    
    // MARK: - Init
    
    init(view: CurrenciesListVC) {
        self.view = view
    }
    
    // MARK: - CurrenciesListRoutable Protocol Methods
    
    func dismissList() {
        view?.dismiss(animated: true)
    }
}

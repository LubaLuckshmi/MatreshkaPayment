// 
//  HomeBuilder.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

final class HomeBuilder {
    
    static func build() -> HomeVC {
        let view = HomeVC()
        let router = HomeRouter(view: view)
        let networkManager = OpenExchangeRatesManager()
        let dataStore = CurrencyModuleDataStore()
        let presenter = HomePresenter(
            view: view,
            router: router,
            networkManager: networkManager
        )
        presenter.dataStore = dataStore
        view.presenter = presenter
        return view
    }
}

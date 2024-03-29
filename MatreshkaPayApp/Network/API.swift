//
//  API.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

struct API {
    static let baseURL = "https://openexchangerates.org/api/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

struct LatestEndpoint: Endpoint {
    let path = "latest.json"
    var url: String { return API.baseURL + path }
}

struct CurrenciesEndpoint: Endpoint {
    let path = "currencies.json"
    var url: String { return API.baseURL + path }
}

extension API {
    struct Factory {
        static func createLatestEndpoint() -> Endpoint {
            return LatestEndpoint()
        }
    
        static func createCurrenciesEndpoint() -> Endpoint {
            return CurrenciesEndpoint()
        }
    }
}

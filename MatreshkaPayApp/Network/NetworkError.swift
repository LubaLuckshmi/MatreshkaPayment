//
//  NetworkError.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case networkError
    case parsingError
    case conversionError

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided was invalid."
        case .networkError:
            return "There was a problem with the network connection."
        case .parsingError:
            return "There was a problem parsing the data."
        case .conversionError:
            return "There was a problem converting the data."
        }
    }
}

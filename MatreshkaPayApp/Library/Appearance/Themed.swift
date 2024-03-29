//
//  Themed.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

protocol Themed {
    var theme: ThemeProvider { get set }
    func applyTheme()
}

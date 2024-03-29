//
//  ThemeProvider.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

protocol ThemeProvider {
    
    // Colors
    var mainBackgroundColor: UIColor { get }
    var enabledBackgroundColor: UIColor { get }
    var disabledBackgroundColor: UIColor { get }
    var enabledTextColor: UIColor { get }
    var disabledTextColor: UIColor { get }

    // Fonts
    var titleFont: UIFont { get }
    var hintFont: UIFont { get }
    var inputFont: UIFont { get }
    var switcherFont: UIFont { get }
    var bodyFont: UIFont { get }
    var buttonFont: UIFont { get }
    var symbolFont: UIFont { get }
}

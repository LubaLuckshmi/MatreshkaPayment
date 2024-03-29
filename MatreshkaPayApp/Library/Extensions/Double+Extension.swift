//
//  Double+Extension.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import Foundation

extension Double {
    
    func moneyToString() -> String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(self))"
        } else {
            return String(format: "%.2f", self)
        }
    }
}

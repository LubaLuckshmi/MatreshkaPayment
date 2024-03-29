//
//  Autolayout.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

import UIKit

@propertyWrapper
public struct UsingAutoLayout<T: UIView> {
    
    public var wrappedValue: T {
        didSet {
            setAutoLayout()
        }
    }
    
    public init (wrappedValue: T) {
        self.wrappedValue = wrappedValue
        setAutoLayout()
    }
    
    func setAutoLayout() {
        wrappedValue.translatesAutoresizingMaskIntoConstraints = false
    }
}

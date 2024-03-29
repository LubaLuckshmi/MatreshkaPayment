//
//  DataStore.swift
//  MatreshkaPayApp
//
//  Created by Admin on 27.02.2024.
//

protocol DataStore: AnyObject {
    
    // MARK: - Properties
    
    associatedtype E
    var selectedElement: E? { get set }
    var elements: [E] { get set }
    var onDataUpdated: (() -> Void)? { get set }

    // MARK: - Methods
    
    func updateData()
}


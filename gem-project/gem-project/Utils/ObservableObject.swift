//
//  ObservableObject.swift
//  FunRecipe
//
//  Created by 中江洋史 on 2022/10/28.
//

import Foundation

final class ObservableObject<T> {
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    private var listener: ((T) -> Void)?
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping(T) -> Void) {
        listener(value)
        self.listener = listener
    }
}

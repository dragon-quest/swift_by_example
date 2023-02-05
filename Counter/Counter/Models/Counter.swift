//
//  Counter.swift
//  Counter
//

import Foundation

struct Counter {
    var count = 0

    mutating func increment() {
        self.count += 1
    }

    mutating func decrement() {
        self.count -= 1
    }
    
    mutating func incrementRandom10() {
        self.count += random10()
    }

    mutating func decrementRandom10() {
        self.count -= random10()
    }
    
    private func random10() -> Int {
        Int.random(in: 1 ... 10)
    }
}

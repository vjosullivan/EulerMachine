//
//  Problem002.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//


class Problem002: Problem {
    
    convenience init() {
        self.init(number:2, title: "Even Fibonacci numbers", summary:"Sum all the even Fibonacci numbers below 4,000,000.")
    }
    
    override func solve() -> String {
        // Get all Fibonacci numbers up to 4,000,000.
        let sequence = fibonacciSequence(4_000_000)
        // Filter the even numbers and sum them.
        let result = sequence.filter{$0 % 2 == 0}.reduce(0, combine: +)
        
        return "\(result)"
    }

    private func fibonacciSequence(limit: Int) -> [Int] {
        var sequence = [1, 1]
        var next = 2
        while next < limit {
            sequence.append(next)
            let n = sequence.count - 1
            next = sequence[n] + sequence[n - 1]
        }
        return sequence
    }
}

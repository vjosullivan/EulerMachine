//
//  Problem007.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem007: Problem {
    
    convenience init() {
        self.init(number:7, title: "10,001st prime", summary:"What is the 1,001st prime?")
    }
    
    override func solve() -> String {
        var primeCount = 2
        let limit = 10_001
        var n = 5
        repeat {
            if isPrime(n) { primeCount += 1 }
            n += 2
        } while primeCount < limit
        
        return "\(n - 2)"
    }
}

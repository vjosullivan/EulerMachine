//
//  Problem010.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem010: Problem {

    convenience init() {
        self.init(number:10, title: "Summation of primes", summary:"Find the sum of all the primes below two million.")
    }

    override func solve() -> String {
        var sumP = 5
        let pMax = 2_000_000 // 2_000_000
        var p = 5
        while p < pMax {
            if isPrime(p) {
                sumP += p
                print(p)
            }
            p += 2
        }

        return "\(sumP)"
    }
}

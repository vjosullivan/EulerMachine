//
//  Problem012.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//
import Darwin

class Problem012: Problem {

    convenience init() {
        self.init(number:12, title: "Highly divisible triangular number", summary:"What is the value of the first triangle number to have over five hundred divisors?")
    }

    override func solve() -> String {
        var cMax = 0
        var triangleN = 0
        for n in 3...19_999 {
            triangleN = sumTo(n)
            let count = divisors(triangleN)
            if count > cMax {
                cMax = count
                if count > 500 {
                    break
                }
            }
        }

        return "\(triangleN)"
    }

    /// - returns: The count of divisors of the given number.
    ///
    private func divisors(n: Int) -> Int {
        var divs = 2
        // Only check as far as square root and add 2 per divisor found
        // because each divisor has a "twin" (e.g 4*8 = 8*4 = 28).
        for f in 2..<Int(sqrt(Double(n)))  {
            if n % f == 0 {
                divs += 2
            }
        }
        return divs
    }

    /// - returns: The sum of all the natural numbers from 1 to n.
    ///
    private func sumTo(n: Int) -> Int {
        return Array(1...n).reduce(0, combine: +)
    }
}
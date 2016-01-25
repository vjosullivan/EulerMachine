//
//  Problem015.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//
import Foundation

class Problem015: Problem {
    
    convenience init() {
        self.init(number:15, title: "Lattice paths", summary:"How many (right and down only) routes are there through a 20×20 grid (TL to BR)?")
    }
    
    override func solve() -> String {
        // This problem is exactly equivalent to asking how many combination of 20 heads and 20 tails can result from throwing a coin 40 times.
        // the solution is given by the binomial equation (which is closely related to triangular numbers from earlier Project Euler questions.
        // n!/(n-k)!k! for selecting k objects out of n.
        // In this case n = 40 and k (and n - k) = 20.  Slightly too big for Swift to handle natively but we can use NSDecimalNumber instead
        // (Even though it's an extraordinarily inefficient way of solving this problem.  It works.)
        
        let dn40f = bigFactorial(NSDecimalNumber(int: Int32(40)))
        let dn20f = bigFactorial(NSDecimalNumber(int: Int32(20)))
        var result = dn40f.decimalNumberByDividingBy(dn20f)
            result =             result.decimalNumberByDividingBy(dn20f)
        result = result.decimalNumberByRoundingAccordingToBehavior(NSDecimalNumberHandler(roundingMode: NSRoundingMode.RoundPlain, scale: 0, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: false))
        return "\(result)"
    }
    
    /// A rather verbose function that simply returns the factorial of the given number.
    ///
    private func bigFactorial(dn: NSDecimalNumber) -> NSDecimalNumber {
        return dn.integerValue == 0 ? NSDecimalNumber(double: 1.0): dn.decimalNumberByMultiplyingBy(bigFactorial(dn.decimalNumberBySubtracting(NSDecimalNumber(double: 1.0))))
    }

}
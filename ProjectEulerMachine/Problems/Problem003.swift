//
//  Problem003.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem003: Problem {
    
    convenience init() {
        self.init(number:3, title: "Largest prime factor", summary:"What is the largest prime factor of the number 600,851,475,143?")
    }
    
    override func solve() -> String {
        let result = primeFactors(600_851_475_143).maxElement()!
        
        return "\(result)"
    }

    private func primeFactors(n: Int) -> [Int] {
        var pf = [Int]()
        var nn = n
        var f = 2
        while f <= nn  {
            if nn % f == 0 {
                pf.append(f)
                nn /= f
            } else {
                f += 1
            } 
        }
        return pf
    }
}

//
//  Problem005.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem005: Problem {
    
    convenience init() {
        self.init(number:5, title: "Smallest multiple", summary:"What is the smallest positive number, evenly divisible by the numbers 1 to 20?")
    }
    
    override func solve() -> String {
        // Create an array of numbers in the given range.
        let max = 20
        var n = Array(2...max)
        let last = n.count - 1
        let secondLast = last - 1
        
        // Remove all the prime factors that occur in more than one number.
        for i in 0...secondLast {
            for j in (i + 1)...last {
                if n[j] % n[i] == 0 {
                    let range = Range(start: j, end: j + 1)
                    n.replaceRange(range, with: [n[j] / n[i]])
                }
            }
        }
        
        // Multiply together the remaining prime factors to get the answer.
        let result = n.reduce(1, combine: *)
        return "\(result)"
    }
}

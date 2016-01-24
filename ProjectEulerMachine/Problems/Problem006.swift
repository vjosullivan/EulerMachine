//
//  Problem006.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem006: Problem {
    
    convenience init() {
        self.init(number:6, title: "Sum square difference", summary:"Find the difference between the sum of the squares of 1 to 100 and the square of the sum.")
    }
    
    override func solve() -> String {
        let max = 100
        let n = Array(1...max)
        let nSum = n.reduce(0, combine: +)
        let nSumSquared = nSum * nSum
        
        let nSquared = n.map{ $0 * $0 }
        let nSquaredSum = nSquared.reduce(0, combine: +)
        
        let result = nSumSquared - nSquaredSum
        return "\(result)"
    }
}

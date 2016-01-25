//
//  Problem001.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 23/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem001: Problem {

    convenience init() {
        self.init(number:1, title: "Multiples of 3 and 5", summary:"Find the sum of all the multiples of 3 and 5 below 1,000.")
    }
    
    override func solve() -> String {
        let numbers = Array(1..<1000)
        let result = numbers.filter{$0 % 3 == 0 || $0 % 5 == 0}.reduce(0, combine: +)
        
        return "\(result)"
    }
}
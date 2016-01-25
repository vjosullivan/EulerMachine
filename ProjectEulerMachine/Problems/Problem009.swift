//
//  Problem009.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem009: Problem {

    convenience init() {
        self.init(number:9, title: "Special Pythagorean triplet", summary:"Find the one Pythagorian triplet where a + b + c = 1,000.")
    }

    override func solve() -> String {
        var result = 0
        for c in 333...997 {
            for b in 2..<c {
                let a = 1000 - b - c
                if a > 0 && a < b {
                    if a * a + b * b == c * c {
                        result = a * b * c
                    }
                }
            }
            if result != 0 { break }
        }

        return "\(result)"
    }
}

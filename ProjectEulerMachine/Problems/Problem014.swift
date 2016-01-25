//
//  Problem014.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem014: Problem {

    convenience init() {
        self.init(number:14, title: "Longest Collatz sequence", summary:"Which starting number, under one million, produces the longest Collatz sequence?")
    }

    override func solve() -> String {
        var cMax = 1
        var nBest = 0
        for n in 2..<1_000_000 {
            var c = 1
            var nn = n
            while nn != 1 {
                nn = (nn % 2 == 0) ? nn / 2 : nn * 3 + 1
                c += 1
            }
            if (c > cMax) {
                cMax = c
                nBest = n
            }
        }

        return "\(nBest)"
    }
}
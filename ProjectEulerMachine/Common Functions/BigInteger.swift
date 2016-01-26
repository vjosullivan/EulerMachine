//
//  BigInteger.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 26/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

struct BigInteger {

    private var value = [0]
    private var positive: Bool

    init(int: Int) {
        self.positive = (int >= 0)
        if int == 0 {
            value = [0]
        } else {
            var i = abs(int)
            var temp = [Int]()
            while i > 0 {
                temp.append(i % 10)
                i /= 10
            }
            value = temp
        }
    }

    var description: String {
        var desc = ""
        for i in (0..<value.count).reverse() {
            desc += String(value[i])
        }
        return positive ? desc : "-" + desc
    }
}

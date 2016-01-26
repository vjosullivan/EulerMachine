//
//  BigInteger.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 26/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

struct BigInteger {

    let value: [Int]
    let positive: Bool

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

    private init(array: [Int], positive: Bool) {
        self.positive = positive
        self.value = array
    }

    func add(other: BigInteger) -> BigInteger {
        var index = 0
        if self.positive == other.positive {
            var result = [Int]()
            var sum = 0
            while index < self.value.count && index < other.value.count {
                sum = self.value[index] + other.value[index]
                result.append(sum % 10)
                sum /= 10
                index += 1
            }
            if sum > 0 { result.append(sum) }
            return BigInteger(array: result, positive: positive)
        } else {
            return subtract(other)
        }
    }

    func subtract(other: BigInteger) -> BigInteger {
        return other
    }

    var description: String {
        var desc = ""
        for i in (0..<value.count).reverse() {
            desc += String(value[i])
        }
        return positive ? desc : "-" + desc
    }
}

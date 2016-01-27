//
//  BigInteger.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 26/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

struct BigInteger {

    // MARK: Properties

    let value: [Int]
    let positive: Bool

    var length: Int {
        return self.value.count
    }

    // MARK: Functions

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

    var description: String {
        var desc = ""
        for i in (0..<value.count).reverse() {
            desc += String(value[i])
        }
        return positive ? desc : "-" + desc
    }
}

// MARK: - Extensions
// MARK: - Addition extension

extension BigInteger {

    func add(other: BigInteger) -> BigInteger {
        if self.positive == other.positive {
            if self.length >= other.length {
                return BigInteger.add(self, to: other)
            } else {
                return BigInteger.add(other, to: self)
            }
        } else {
            return subtract(other)
        }
    }

    private static func add(a: BigInteger, to b: BigInteger) -> BigInteger {
        // Pad b with leading zeros to make it same length as a.
        let diff = a.length - b.length
        var bValue = b.value
        for _ in 0..<diff { bValue.append(0) }

        var result = [Int]()
        var index = 0
        var carry = 0
        while index < a.length {
            carry += a.value[index] + bValue[index]
            result.append(carry % 10)
            carry /= 10
            index += 1
        }
        if carry > 0 { result.append(carry) }
        return BigInteger(array: result, positive: a.positive)
    }
}

// MARK: Subtraction extension

extension BigInteger {

    func subtract(byOther: BigInteger) -> BigInteger {
        return BigInteger(int: 0)
    }
}

// MARK: Multiplication extension

extension BigInteger {

    func multiply(byOther: BigInteger) -> BigInteger {
        return BigInteger(int: 0)
    }
}

// MARK: Division extension

extension BigInteger {

    func divide(byOther: BigInteger) -> BigInteger {
        return BigInteger(int: 0)
    }
}


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

    init() {
        self.init(int: 0)
    }

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
        print("value = \(value)")
    }

    private init(array: [Int], positive: Bool) {
        self.positive = positive
        self.value = array
    }
}

// MARK: - Extensions
// MARK: - CustomStringConverible extension

extension BigInteger: CustomStringConvertible {

    var description: String {
        var desc = ""
        for i in (0..<value.count).reverse() {
            desc += String(value[i])
        }
        return positive ? desc : "-" + desc
    }
}

// MARK: - Addition extension

extension BigInteger {

    func add(other: BigInteger) -> BigInteger {
        if self.positive == other.positive {
            return BigInteger(array: BigInteger.add(self.value, to: other.value), positive: positive)
        } else {
            return subtract(other)
        }
    }

    private static func add(var a: [Int], var to b: [Int]) -> [Int] {

        // Make a and b equal length.
        padOut(a: &a, b: &b)

        var result = [Int]()
        var index = 0
        var carry = 0
        while index < a.count {
            carry += a[index] + b[index]
            result.append(carry % 10)
            carry /= 10
            index += 1
        }
        if carry > 0 { result.append(carry) }
        return result
    }

    ///  Pad the shorter of the two arguments (with zeroes) to an equal length to the longer.
    ///
    private static func padOut(inout a a: [Int], inout b: [Int]) {
        let diff = a.count - b.count
        if diff > 0 {
            for _ in 0..<diff { b.append(0) }
        } else {
            for _ in 0..<(-diff) { a.append(0) }
        }
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

    func multiply(by other: BigInteger) -> BigInteger {
        if self.description == "0" || other.description == "0" {
            return BigInteger(int: 0)
        } else {
            var partResult = [Int]()
            var result = BigInteger()
            var product = 0
            for sIndex in 0..<self.length {
                for oIndex in 0..<other.length {
                    product += self.value[sIndex] * other.value[oIndex]
                    partResult[sIndex] = product % 10
                    product /= 10
                }
                //result = result.add(<#T##other: BigInteger##BigInteger#>)
            }
            return BigInteger(int: 0)
        }
    }
}

// MARK: Division extension

extension BigInteger {

    func divide(byOther: BigInteger) -> BigInteger {
        return BigInteger(int: 0)
    }
}


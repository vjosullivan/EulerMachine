//
//  Problem004.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem004: Problem {
    
    convenience init() {
        self.init(number:4, title: "Largest palindrome product", summary:"Find the largest palindrome made from the product of two 3-digit numbers?")
    }
    
    override func solve() -> String {
        var largestPalindromeFound = 0
        var i = 999
        var j = 999
        while i > 99 {
            while i <= j && i * j > largestPalindromeFound {
                let p = i * j
                if isPalindrome(p) && p > largestPalindromeFound {
                    largestPalindromeFound = p
                    print("\(i) * \(j) = \(p)")
                }
                j -= 1
            }
            if j == 999 { break }
            i -= 1
            j = 999
        }
        return "\(largestPalindromeFound)"
    }

    private func arrayFromInt(n: Int) -> [Int] {
        var nn = n
        var a = [Int]()
        while nn > 0 {
            a.append(nn % 10)
            nn /= 10
        }
        return a
    }
    
    private func isPalindrome(n: Int) -> Bool {
        var a = arrayFromInt(n)
        while a.count > 0 {
            if a.first != a.last {
                return false
            } else {
                a.removeFirst()
                if a.count % 2 != 0 {
                    a.removeLast()
                }
            }
        }
        return true
    }
}


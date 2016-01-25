//
//  Common Functions.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 25/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//
import Darwin

func isPrime(n: Int) -> Bool {
    for i in 2...Int(sqrt(Double(n)) + 1) {
        if n % i == 0 {
            return false
        }
    }
    return true
}
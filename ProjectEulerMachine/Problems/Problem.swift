//
//  Problem.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 23/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

class Problem {
    
    let title:String
    let number:Int
    let summary:String
    var solution:String = ""
    var duration:Double = 0.0
    
    init(number: Int, title: String, summary: String) {
        self.number  = number
        self.title   = title
        self.summary = summary
    }
    
    func solve() -> String {
        return "Hi!"
    }
}

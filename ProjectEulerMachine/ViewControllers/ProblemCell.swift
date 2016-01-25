//
//  ProblemCell.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 24/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ProblemCell: UITableViewCell {

    private var prob: Problem?
    var problem:Problem? {
        get {
            return prob
        }
        set (newValue) {
            prob = newValue
            if let prob = prob {
                number.text   = "\(prob.number)"
                title.text    = prob.title
                summary.text    = prob.summary
                solution.text = ""
                duration.text = ""
            }
        }
    }
        
    @IBOutlet weak var number: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var summary: UILabel!
    @IBOutlet weak var solution: UILabel!
    @IBOutlet weak var duration: UILabel!
    
    @IBAction func execute() {
        solution.textColor = UIColor.redColor()
        solution.text = "Thinking..."
        duration.text = ""
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)) {
            let startTime = CFAbsoluteTimeGetCurrent()
            let result = self.prob?.solve()
            let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
            dispatch_async(dispatch_get_main_queue()) {
                print(timeElapsed)
                if timeElapsed < 0.001 {
                        self.duration.text = String(format: "%.0fμs", timeElapsed * 1_000_000)
                } else if timeElapsed < 1 {
                    self.duration.text = String(format: "%.0fms", timeElapsed * 1_000)
                } else {
                    self.duration.text = String(format: "%3.3fs", timeElapsed)
                }
                self.solution.textColor = UIColor(red: 0.0, green: 0.5, blue: 0.0, alpha: 1.0)
                self.solution.text = "Solution: \(result!)."
            }
        }
    }
}

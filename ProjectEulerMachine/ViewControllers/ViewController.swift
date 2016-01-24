//
//  ViewController.swift
//  ProjectEulerMachine
//
//  Created by Vincent O'Sullivan on 23/01/2016.
//  Copyright © 2016 Vincent O'Sullivan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var problemTableView: UITableView!
    
    var problems = [Problem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        problems = configureProblems()
        
        problemTableView.dataSource = self
        problemTableView.delegate   = self
    }

    private func configureProblems() -> [Problem]{
        var problems = [Problem]()
        problems.append(Problem001())
        problems.append(Problem002())
        problems.append(Problem003())
        problems.append(Problem004())
        problems.append(Problem005())
        problems.append(Problem006())
        problems.append(Problem007())
        problems.append(Problem008())
        return problems
    }
}

extension ViewController: UITableViewDataSource {
 
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("ProblemCell", forIndexPath:indexPath) as! ProblemCell
        cell.problem = problems[indexPath.row]
        return cell;
    }
}

extension ViewController: UITableViewDelegate {
    
}

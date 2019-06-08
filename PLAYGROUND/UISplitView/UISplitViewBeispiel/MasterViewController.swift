//
//  MasterViewController.swift
//  UISplitViewBeispiel
//
//  Created by Jan Brinkmann on 15/06/15.
//  Copyright (c) 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var farben = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        farben = ["rot", "gelb", "blau"]
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return farben.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("colorCell", forIndexPath: indexPath) as! UITableViewCell

        cell.textLabel?.text = farben[indexPath.row]

        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "show" {
            var ctrl = segue.destinationViewController as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow()
            let color = farben[indexPath!.row]
         
            if color == "rot" {
                ctrl.view.backgroundColor = UIColor.redColor()
            } else if color == "gelb" {
                ctrl.view.backgroundColor = UIColor.yellowColor()
            } else {
                ctrl.view.backgroundColor = UIColor.blueColor()
            }
        }
    }
    
}

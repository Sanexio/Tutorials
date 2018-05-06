//
//  DetailController.swift
//  MeineRezepte
//
//  Created by Jan Brinkmann on 01/09/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

class DetailController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var tableView: UITableView!
    
    var currentRecipe:Rezept?
    
    // MARK: - View Methoden
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        self.title = currentRecipe!.name
        // die Fkt. self.title gibt das jeweils ausgewählte Rezept in der Kopfleiste der App aus
    }
    
    
    // MARK: - DataSource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("zutaten")
        
        let zutat = currentRecipe!.zutaten[indexPath.row]
        let menge = zutat["menge"]!
        let name = zutat["name"]!
        cell!.textLabel!.text = "\(menge) \(name)"
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if currentRecipe != nil {
            return currentRecipe!.zutaten.count
        }
        
        return 0
    }
    
    
    // MARK: - Delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("orderAtAmazon", sender: self)
    }
    
}

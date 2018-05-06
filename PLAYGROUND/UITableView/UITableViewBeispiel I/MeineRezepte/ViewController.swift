//
//  ViewController.swift
//  MeineRezepte
//
//  Created by Jan Brinkmann on 31/08/15.
//  Copyright © 2015 Jan Brinkmann. All rights reserved.
//

import UIKit

// Vorbereitung im Storyboard:
// - ViewController mit TableView anlegen, Constraints setzen
// - Prototype-Cell (=1) anlegen (Attributes-Inspector)
// - TableViewCell auswählen und im Attributes-Inspector Reuse-Identifier setzen (rezeptRow)


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{ // Protokolle UITableViewDelegate & UITableViewDataSource müssen importiert werden
    
    @IBOutlet weak var tableView: UITableView!
    // Definition Outlet im Storyboard mit Assistent Editor (wichtig: ViewElement muss die TableView sein)
    // CAVE: UITableView verwendet auch die Bezeichnung "tableView"!
    
    var tableData = [Rezept]()
    // greift auf die Klasse Rezept unter Rezept.swift zu; dient als Speicher
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let muesli = Rezept(rezeptName: "Müsli",
            dieZutaten: [
                ["name": "Haferflocken", "menge": "100gr"],
                ["name": "Nüsse", "menge": "30gr"]
            ])
        tableData.append(muesli)
        
        let nudeln = Rezept(rezeptName: "Spaghetti",
            dieZutaten: [
                ["name": "Spaghetti", "menge": "70gr"],
                ["name": "Tomaten", "menge": "3"]
            ])
        tableData.append(nudeln)
        
        let pizza = Rezept(rezeptName: "Pizza",
            dieZutaten: [
                ["name": "Tomaten", "menge": "3"],
                ["name": "Käse", "menge": "50gr"]
            ])
        tableData.append(pizza)
        
        tableView.reloadData()
        // Alternative für diese Zeile wäre ein Property-Observer für die Variable "tableData"
    }

    // MARK: - Data Source
    // Welche Daten sollen angezeigt werden?
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    } // als Sektion wird nur eine übergeben, die Methode liefert dann die Anzhal der Dateneinträge im Array "tableData" zurück
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    } // wird hier statisch als 1 angegeben
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("rezeptRow")!
        
        cell.textLabel?.text = tableData[indexPath.row].name
        // mit .name wird auf den Namen des Rezeptes zugegriffen (siehe Rezept.swift)
        // der Zugriff auf die Zutaten wird in der zweiten View vorgenommen
        
        return cell
    }
    // "cellForRowAtIndexPath" definiert in welcher Sektion und in welcher Zeile man sich befindet
    // mit "tableView.dequeueReusableCellWithIdentifier" wird auf den ReuseIdentifier zugegriffen
    // mit "cell.textLabel?.text = tableData[indexPath.row].name" wird der entsprechende Eintrag angezeigt
    
    
    
    
    // MARK: - Delegate
    // Was geschieht, wenn eine Aktion ausgeführt wird?
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        self.performSegueWithIdentifier("showDetail", sender: self)
    }
    // Aufruf der Methode "didSelectRowAtIndexPath", nachdem eine Zeile im aktuellen View markiert wurde.
    
    // Vorbereitung:
    // - Zweiten View-Controller im Storyboard anlegen
    // - mit Ctrl-Klick vom Haupt-View-Controller auf die View von 2. Controller einen Show-Segue anlegen
    // - der Show-Segue integriert auch automatisch den NavigationController
    // - Identifier für den Segue im Attributes-Inspector setzen (showDetail)
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let ctrl = segue.destinationViewController as! DetailController
        let indexPath = tableView.indexPathForSelectedRow
        let rezept = tableData[indexPath!.row]
        
        ctrl.currentRecipe = rezept
    }
    // Bevor der Sprung in den nächsten ViewController stattfindet, wird die Methode "prepareForSegue" aufgerufen.
    // Hier wird ein Controller ("DetailController") definiert, der die Eigenschaft "currentRecipe" aus Rezept.swift besitzt.
    // CAVE: Hier muss im Identity-Inspector des neu angelegten ViewControllers als Custom Class der "DetailController" definiert sein.
    // Der IndexPath muss hier allerdings noch mal extra gesetzt werden. Er entspricht der Zeile, die gerade ausgewählt wurde.
    // Über den IndexPath kann man dann das entsprechende Rezept holen.
    // Nun kommt der entscheidende Schritt: Damit das ausgewählte Rezept in der View auch zur Verfügung steht,
    // muss die Zuordnung über "ctrl.currentRecipe = rezept" erfolgen.
    
    // Abschließend müssen "delegate & datasource" im Storyboard als Outlets noch mit dem ViewController verbunden werden:
    // - TableView markieren und im Connections-Inspector delegate und datasource als Outlet mit dem ViewVontroller verbinden.
    
    
    
    // MARK: - Editing Table
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            tableData.removeAtIndex(indexPath.row)
            // hiermit werden die Daten aus der Tabelle gelöscht
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            // hiermit wird die entsprechende Zeile aus der Tabelle entfernt
            // Alternative wäre über "reload Data" - hier würde die Tabelle komplett neu geladen

        }
    }
}

